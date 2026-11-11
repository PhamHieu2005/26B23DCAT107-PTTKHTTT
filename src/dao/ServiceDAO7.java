package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Service7;

public class ServiceDAO7 extends DAO7 {

    public ServiceDAO7() {
        super();
    }

    public Service7[] searchService7(String key) {
        ArrayList<Service7> result = new ArrayList<Service7>();
        String sql = "SELECT * FROM tblService7 WHERE name LIKE ? ORDER BY name";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(toService(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toArray(new Service7[0]);
    }

    public Service7 getService7(int id) {
        String sql = "SELECT * FROM tblService7 WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return toService(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private Service7 toService(ResultSet rs) throws Exception {
        Service7 s = new Service7();
        s.setId(rs.getInt("id"));
        s.setName(rs.getString("name"));
        s.setPrice(rs.getFloat("price"));
        s.setDuration(rs.getInt("duration"));
        s.setDescription(rs.getString("description"));
        return s;
    }
}
