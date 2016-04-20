/**
 * Created by pxq on 15-2-7.
 */

var MAX_MENU = 3;
var MAX_SUB_MENU = 5;

// 一级页单
function WxMenu(name) {
    this.name = name;
    this.sub_menu_list = [];
    this.id = null;

    this.to_object = function() {
        var sub = [];
        for (var i = 0; i < this.sub_menu_list.length; i++) {
            sub.push(this.sub_menu_list[i].to_object());
        }
        return {
            'name': this.name,
            'sub_menu_list': sub,
            'id': this.id
        }
    }
}

// 二级页单
function WxSubMenu(name) {
    this.name = name;
    this.action = null;
    this.id = null;

    this.to_object = function() {
        return {
            'name': this.name,
            'action': this.action,
            'id': this.id
        }
    }
}

var wx_menu = function(menu_json) {
    this.menu_list = [];

    this._obj_get_str_or_error = function(obj, key) {
        var val = obj[key];
        if (typeof val === "string")
            return val;
        throw new Error("值不存在或类型错误");
    };

    this._ensure_arr_and_max_length = function(arr, max_length) {
        if (!(arr instanceof Array))
            throw new Error("类型错误：需要Array");
        if (arr.length > max_length) {
            throw new Error("Array超过最大长度：" + max_length);
        }
    };

    this._obj_get_arr_or_error = function(obj, key, max_length) {
        var val = obj[key];
        this._ensure_arr_and_max_length(val, max_length);
        return val;
    };

    this._from_json = function(json_val) {
        var obj = json_val.parseJSON();
        if (obj == null) {
            throw new Error("解析JSON出错");
        }

        this._ensure_arr_and_max_length(obj, MAX_MENU);

        for (var i = 0; i < obj.length; i++) {
            var menu_obj = obj[i];
            if (menu_obj instanceof Object) {
                // 一级菜单
                var menu = new WxMenu(
                    this._obj_get_str_or_error(menu_obj, "name"));
                menu.id = menu_obj['id'];

                // 二级菜单
                var sub_menu_arr = this._obj_get_arr_or_error(
                    menu_obj, "sub_menu", MAX_SUB_MENU);
                for (var j = 0; j < sub_menu_arr.length; j++) {
                    var sub_menu_item = sub_menu_arr[j];
                    var sub_menu = new WxSubMenu(
                        this._obj_get_str_or_error(sub_menu_item, "name"));
                    // action 可以暂时为空（为空表示没有行为，不同步到客户端）
                    sub_menu.action = sub_menu_item["action"];
                    sub_menu.id = sub_menu_item["id"];
                    menu.sub_menu_list.push(sub_menu);
                }
                this.menu_list.push(menu);
            }
            else {
                throw new Error("menu不是Object类型");
            }
        }
    };

    this._to_json = function() {
        var menu = [];
        for (var i = 0; i < this.menu_list.length; i++) {
            menu.push(this.menu_list[i].to_object());
        }
        return menu.toJSON();
    };

    // 接口
    this.init = function(json_str) {
        try {
            this._from_json(json_str);
        }
        catch (error) {
            console.error(error);
        }
    };

    this.can_add_menu = function() {
        return this.menu_list.length < MAX_MENU;
    };

    this.can_add_sub_menu = function(idx) {
        if (i >= 0 && i < this.menu_list.length) {
            if (this.menu_list[i].sub_menu_list.length < MAX_SUB_MENU) {
                return true;
            }
        }
        return false;
    };

    this.add_menu = function(name) {
        if (!this.can_add_menu()) {
            return -1;
        }

        this.menu_list.push(
            new WxSubMenu(name)
        );
        return 0;
    };

    this.add_sub_menu = function(idx, name, action) {
        if (!this.can_add_sub_menu(idx)) {
            return -1;
        }

        var menu = this.menu_list[idx];
        var sub_menu = new WxSubMenu(name);
        sub_menu.action = action;
        menu.sub_menu_list.push(sub_menu);
        return 0;
    };
};