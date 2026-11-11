package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import model.ImportBill7;
import model.ImportedPart7;

public class ImportBillDAO7 extends DAO7 {

    public ImportBillDAO7() {
        super();
    }

    // lưu tblImportBill7 và các dòng tblImportedPart7 trong một transaction
    public boolean saveImportBill7(ImportBill7 bill) {
        String sqlBill = "INSERT INTO tblImportBill7 (importDate, note, tblSupplierid, tblStaffid) VALUES (?, ?, ?, ?)";
        String sqlPart = "INSERT INTO tblImportedPart7 (quantity, price, tblImportedBillid, tblSparePartid) VALUES (?, ?, ?, ?)";
        try {
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sqlBill, Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, new Timestamp(bill.getImportDate().getTime()));
            ps.setString(2, bill.getNote());
            ps.setInt(3, bill.getSupplier().getId());
            ps.setInt(4, bill.getStorekeeper().getId());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                bill.setId(keys.getInt(1));
            }
            PreparedStatement psp = con.prepareStatement(sqlPart);
            for (ImportedPart7 p : bill.getImportedParts()) {
                psp.setInt(1, p.getQuantity());
                psp.setFloat(2, p.getPrice());
                psp.setInt(3, bill.getId());
                psp.setInt(4, p.getSparePart().getId());
                psp.executeUpdate();
            }
            con.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                con.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
