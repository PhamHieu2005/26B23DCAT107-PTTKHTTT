package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.SparePart7;

public class SparePartDAO7 extends DAO7 {

    public SparePartDAO7() {
        super();
    }

    public SparePart7[] searchSparePart7(String key) {
        ArrayList<SparePart7> result = new ArrayList<SparePart7>();
        String sql = "SELECT * FROM tblSparePart7 WHERE name LIKE ? ORDER BY name";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(toPart(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toArray(new SparePart7[0]);
    }

    public SparePart7 getSparePart7(int id) {
        String sql = "SELECT * FROM tblSparePart7 WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return toPart(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSparePart7(SparePart7 part) {
        String sql = "INSERT INTO tblSparePart7 (name, manufacturer, price, description) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, part.getName());
            ps.setString(2, part.getManufacturer());
            ps.setFloat(3, part.getPrice());
            ps.setString(4, part.getDescription());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                part.setId(keys.getInt(1));
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private SparePart7 toPart(ResultSet rs) throws Exception {
        SparePart7 p = new SparePart7();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setManufacturer(rs.getString("manufacturer"));
        p.setPrice(rs.getFloat("price"));
        p.setDescription(rs.getString("description"));
        return p;
    }
}
