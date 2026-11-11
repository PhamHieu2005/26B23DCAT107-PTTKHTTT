# GaraMan – web theo thiết kế trong báo cáo 26B23DCAT107

Web Java (JSP + DAO + lớp thực thể) cài đặt 2 module đã thiết kế chi tiết, cùng chức năng đăng nhập:
- **Search Services/Parts7**: khách hàng tìm kiếm dịch vụ/phụ tùng và xem chi tiết.
- **Import Spare Parts7**: nhân viên kho nhập phụ tùng từ nhà cung cấp (có thêm NCC mới, thêm phụ tùng mới, lưu và in hóa đơn nhập).

Các chức năng khác (đặt lịch, quản lí dịch vụ/phụ tùng/NCC, nhận xe, thanh toán, thống kê) chỉ hiện trên menu với ghi chú "chưa hỗ trợ".

## Cấu trúc (theo biểu đồ gói và biểu đồ lớp thiết kế)

| Thư mục | Gói | Nội dung |
|---|---|---|
| `src/model` | model | Member7, Staff7, Storekeeper7, Customer7, Service7, SparePart7, Supplier7, ImportBill7, ImportedPart7 |
| `src/dao` | dao | DAO7, ServiceDAO7, SparePartDAO7, SupplierDAO7, ImportBillDAO7, MemberDAO7 (đăng nhập) |
| `WebContent/member` | view.member | login7.jsp, doLogin7.jsp, logout7.jsp |
| `WebContent/customer` | view.customer | customerHome7.jsp, search7.jsp, serviceDetail7.jsp, partDetail7.jsp |
| `WebContent/storekeeper` | view.storekeeper | storekeeperHome7.jsp, searchSupplier7.jsp, addSupplier7.jsp, doAddSupplier7.jsp, importPart7.jsp, searchPart7.jsp, addPart7.jsp, doAddPart7.jsp, importBill7.jsp, doSaveImportBill7.jsp |
| `WebContent/manager`, `WebContent/salestaff` | view.manager, view.salestaff | trang chủ (menu chưa hỗ trợ) |
| `sql/garaman.sql` | – | CSDL theo sơ đồ CSDL (các bảng tbl…7) và dữ liệu mẫu |

`MemberDAO7.checkLogin7()` không có trong báo cáo nhưng cần để đăng nhập. JSP viết theo kiểu đơn giản như chương 5 bài giảng (không dùng framework).

## Chạy bằng XAMPP (đã thử trên máy: Tomcat 8.5.96, MariaDB 10.4, JDK 24)

1. Mở **XAMPP Control Panel**, bấm **Start** ở dòng **MySQL**.
2. Tạo CSDL: mở cmd tại thư mục `code` và chạy
   `C:\xampp\mysql\bin\mysql.exe -uroot --default-character-set=utf8mb4 < sql\garaman.sql`
   (hoặc import file `sql\garaman.sql` trong phpMyAdmin). Lệnh này xóa và tạo lại CSDL `garaman`.
3. Chạy `build.bat`: biên dịch Java và chép web vào `C:\xampp\tomcat\webapps\garaman`.
4. Trong XAMPP Control Panel, bấm **Start** ở dòng **Tomcat**.
5. Mở trình duyệt: http://localhost:8080/garaman

Kết nối CSDL nằm trong `src/dao/DAO7.java` (mặc định `root`, mật khẩu rỗng như XAMPP). Đổi ở đó nếu MySQL của bạn có mật khẩu, rồi chạy lại `build.bat`.

## Tài khoản mẫu (mật khẩu đều là `123`)

| Tài khoản | Vai trò |
|---|---|
| an | Khách hàng – Nguyễn Văn An |
| binh | Nhân viên kho – Trần Văn Bình |
| cuong | Nhân viên quản lí |
| dung | Nhân viên bán hàng |

Gợi ý thử: đăng nhập `an`, tìm "dầu"; đăng nhập `binh`, tìm NCC "Phú", chọn NCC, thêm "lọc gió" và "dầu", xác nhận rồi Lưu & in.

`WebContent/WEB-INF/lib/mysql-connector-j-8.4.0.jar` là MySQL JDBC driver tải từ Maven Central (đã đối chiếu SHA-1).
