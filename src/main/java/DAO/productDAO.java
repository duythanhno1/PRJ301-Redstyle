    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Category;
import Entity.Color;
import Entity.Product;
import Entity.Size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group3
 */
public class productDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from  \n"
                + "product p inner join category c on p.category_id = c.category_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertProduct(Product product) {
        System.out.println("insertProduct: " + product);
        String sql = "insert into product (product_id,category_id,product_name,product_price,product_describe,quantity,img) values(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getProduct_id());
            ps.setInt(2, product.getCate().getCategory_id());
            ps.setString(3, product.getProduct_name());
            ps.setFloat(4, product.getProduct_price());
            ps.setString(5, product.getProduct_describe());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImg());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        String sql1 = "insert into product_size (product_id,size) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Size i : product.getSize()) {
                ps = conn.prepareStatement(sql1);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getSize());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        String sql2 = "insert into product_color (product_id,color) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Color i : product.getColor()) {
                ps = conn.prepareStatement(sql2);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getColor());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public void ProductDelete(String product_id) {
        String sql = "delete from product_size where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql1 = "delete from product_color where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql1);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql2 = "delete from product_img where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql2);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sq3 = "delete from product where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq3);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void updateProduct(Product product) {

        String sql2 = "delete from product_size where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql2);
            ps.setString(1, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql3 = "delete from product_color where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql3);
            ps.setString(1, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql4 = "insert into product_size (product_id,size) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Size i : product.getSize()) {
                ps = conn.prepareStatement(sql4);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getSize());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }

        String sql5 = "insert into product_color (product_id,color) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Color i : product.getColor()) {
                ps = conn.prepareStatement(sql5);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getColor());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }

        String sql = "update product set category_id=? ,product_name=? ,product_price=? ,product_describe=? ,quantity=? ,img=? where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, product.getCate().getCategory_id());
            ps.setString(2, product.getProduct_name());
            ps.setFloat(3, product.getProduct_price());
            ps.setString(4, product.getProduct_describe());
            ps.setInt(5, product.getQuantity());
            ps.setString(6, product.getImg());
            ps.setString(7, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Size> getSize() {
        List<Size> list = new ArrayList<>();
        String sql = "select * from product_size";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Color> getColor() {
        List<Color> list = new ArrayList<>();
        String sql = "select * from product_color";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryByName(String name) {
        String sql = "select * from Categories where category_name = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertCategory(String name) {
        String sql = " insert into Category (category_name) values(?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 10 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 5 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id\n"
                + "ORDER BY bd.quantity DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductLow() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id ORDER BY p.product_price ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductHigh() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id ORDER BY p.product_price DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductAZ() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id ORDER BY p.product_name";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByCategory(int category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id WHERE p.category_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_id, c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id WHERE p.product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return (new Product(c, rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Size> getSizeByID(String product_id) {
        List<Size> list = new ArrayList<>();
        String sql = "select * from product_size where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Color> getColorByID(String product_id) {
        List<Color> list = new ArrayList<>();
        String sql = "select * from product_color where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int CountProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM users where isAdmin = 'False' or isAdmin = 'FALSE' ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountProductLow() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product where quantity < 50 ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public List<Product> SearchAll(String text) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT DISTINCT c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img \n"
                + "FROM product p inner join category c on c.category_id = p.category_id inner join product_color ps on p.product_id = ps.product_id\n"
                + "WHERE product_name LIKE ? OR  product_price LIKE ? OR ps.color LIKE ? OR c.category_name LIKE ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ps.setString(2, "%" +text + "%");
            ps.setString(3, text);
            ps.setString(4, "_%" + text + "%_");
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
