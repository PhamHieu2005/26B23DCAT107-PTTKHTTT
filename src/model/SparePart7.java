package model;

import java.io.Serializable;

public class SparePart7 implements Serializable {
    private int id;
    private String name;
    private String manufacturer;
    private float price;
    private String description;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getManufacturer() { return manufacturer; }
    public void setManufacturer(String manufacturer) { this.manufacturer = manufacturer; }
    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
