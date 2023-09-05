package com.example.demo.vo;

import lombok.Data;

@Data
public class ProductVo
{
    private int product_num;
    private String product_category;
    private String product_name;
    private String product_image;
    private String product_color;
    private String product_storage;
    private String product_describey;
    private int product_price;

    public int getProduct_num() {
        return this.product_num;
    }

    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }

    public String getProduct_category() {
        return this.product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public String getProduct_name() {
        return this.product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return this.product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public String getProduct_color() {
        return this.product_color;
    }

    public void setProduct_color(String product_color) {
        this.product_color = product_color;
    }

    public String getProduct_storage() {
        return this.product_storage;
    }

    public void setProduct_storage(String product_storage) {
        this.product_storage = product_storage;
    }

    public String getProduct_describey() {
        return this.product_describey;
    }

    public void setProduct_describey(String product_describey) {
        this.product_describey = product_describey;
    }

    public int getProduct_price() {
        return this.product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public ProductVo(){}

    public ProductVo(int product_num, String product_category, String product_name, String product_image,
            String product_color, String product_storage, String product_describey, int product_price) {
        this.product_num = product_num;
        this.product_category = product_category;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_color = product_color;
        this.product_storage = product_storage;
        this.product_describey = product_describey;
        this.product_price = product_price;
    }

    
}
