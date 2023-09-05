package com.example.demo.vo;

import lombok.Data;

@Data
public class OrderVo
{
    private int order_num;
    private int order_member;
    private int order_pay;
    private int order_product;
    private String order_date;

    public OrderVo() {
    }
    
    public OrderVo(int order_num, int order_member, int order_pay, int order_product, String order_date) {
        this.order_num = order_num;
        this.order_member = order_member;
        this.order_pay = order_pay;
        this.order_product = order_product;
        this.order_date = order_date;
    }


    public int getOrder_num() {
        return this.order_num;
    }

    public void setOrder_num(int order_num) {
        this.order_num = order_num;
    }

    public int getOrder_member() {
        return this.order_member;
    }

    public void setOrder_member(int order_member) {
        this.order_member = order_member;
    }

    public int getOrder_pay() {
        return this.order_pay;
    }

    public void setOrder_pay(int order_pay) {
        this.order_pay = order_pay;
    }

    public int getOrder_product() {
        return this.order_product;
    }

    public void setOrder_product(int order_product) {
        this.order_product = order_product;
    }

    public String getOrder_date() {
        return this.order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

}
