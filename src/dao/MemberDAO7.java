package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Member7;

public class MemberDAO7 extends DAO7 {

    public MemberDAO7() {
        super();
    }

    // kiểm tra đăng nhập; nếu đúng thì điền id, họ tên, vai trò vào member
    public boolean checkLogin7(Member7 member) {
        String sql = "SELECT id, fullname, role FROM tblMember7 WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getUsername());
            ps.setString(2, member.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                member.setId(rs.getInt("id"));
                member.setFullName(rs.getString("fullname"));
                member.setRole(rs.getString("role"));
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
