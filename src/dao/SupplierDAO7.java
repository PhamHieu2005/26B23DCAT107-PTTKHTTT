package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Supplier7;

public class SupplierDAO7 extends DAO7 {

    public SupplierDAO7() {
        super();
    }

    public Supplier7[] searchSupplier7(String name) {
        ArrayList<Supplier7> result = new ArrayList<Supplier7>();
        String sql = "SELECT * FROM tblSupplier7 WHERE name LIKE ? ORDER BY name";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Supplier7 s = new Supplier7();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAddress(rs.getString("address"));
                s.setTel(rs.getString("tel"));
                s.setEmail(rs.getString("email"));
                s.setDescription(rs.getString("description"));
                result.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toArray(new Supplier7[0]);
    }

    public boolean addSupplier7(Supplier7 supplier) {
        String sql = "INSERT INTO tblSupplier7 (name, address, tel, email, description) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, supplier.getName());
            ps.setString(2, supplier.getAddress());
            ps.setString(3, supplier.getTel());
            ps.setString(4, supplier.getEmail());
            ps.setString(5, supplier.getDescription());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                supplier.setId(keys.getInt(1));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
