package model;

import java.io.Serializable;

public class ImportedPart7 implements Serializable {
    private int id;
    private int quantity;
    private float price;
    private SparePart7 sparePart;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }
    public SparePart7 getSparePart() { return sparePart; }
    public void setSparePart(SparePart7 sparePart) { this.sparePart = sparePart; }
}
