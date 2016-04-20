package com.shop.admin.weixin.controller;

public class Test {

	public static void main(String[] args){
		
		int[] array = {1,3,5,7,9,11,13,15};
		
		int sum1 = 0;
		int sum2 = 0;
		int sum3 = 0;
		int total = 0;
		for(int i=0;i<array.length;i++){
			sum1 = array[i];
			for(int j=0;j<array.length;j++){
				
				sum2 = array[j];
				for(int k=0;k<array.length;k++){
					sum3 = array[k];
					
					total = sum1 + sum2 + sum3;
					//if(total == 30){
						System.out.print(sum1);
						System.out.print("+");
						System.out.print(sum2);
						System.out.print("+");
						System.out.print(sum3);
						System.out.print("=");
						System.out.println(total);
					//}
				}
			}
		}
	}
}
