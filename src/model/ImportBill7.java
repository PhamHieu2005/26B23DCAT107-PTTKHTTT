package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class ImportBill7 implements Serializable {
    private int id;
    private Date importDate;
    private String note;
    private Supplier7 supplier;
    private Storekeeper7 storekeeper;
    private ArrayList<ImportedPart7> importedParts = new ArrayList<ImportedPart7>();

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public Supplier7 getSupplier() { return supplier; }
    public void setSupplier(Supplier7 supplier) { this.supplier = supplier; }
    public Storekeeper7 getStorekeeper() { return storekeeper; }
    public void setStorekeeper(Storekeeper7 storekeeper) { this.storekeeper = storekeeper; }
    public ArrayList<ImportedPart7> getImportedParts() { return importedParts; }
    public void setImportedParts(ArrayList<ImportedPart7> importedParts) { this.importedParts = importedParts; }

    // tổng tiền là thuộc tính dẫn xuất, không lưu vào CSDL
    public float getTotalAmount() {
        float total = 0;
        for (ImportedPart7 p : importedParts) {
            total += p.getQuantity() * p.getPrice();
        }
        return total;
    }
}
