package com.clicks.auth;

import java.math.BigDecimal;

public class Medicine {
    private int id;
    private String name;
    private BigDecimal price;
    private String description;
    private String offer;
    private String seller;

    // Constructor
    public Medicine(int id, String name, BigDecimal price, String description, String offer, String seller) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.offer = offer;
        this.seller = seller;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getOffer() {
        return offer;
    }

    public String getSeller() {
        return seller;
    }

    // Setters (optional, if needed)
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }
}
