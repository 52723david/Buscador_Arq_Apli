/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package boostrap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author diego
 */
public class coneccion {

    public static void main(String[] args) {
        Connection con = null;
        Statement stat = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/buscador","root", "");

            // Creamos un Statement para poder hacer peticiones a la bd
            stat = con.createStatement();

            // Insertar 2 filas en la tabla Motor
            String insertar = "INSERT INTO usuarios VALUES ('0','Diego','1105047665','dfguevara@hotmail.com','0990510646')";
            stat.executeUpdate(insertar);
            insertar = "INSERT INTO usuarios VALUES ('0','Fernando','1105047662','dfguevara1@hotmail.com','0990510644')";
            stat.executeUpdate(insertar);

            // Seleccionar todos los datos ordenados por potencia
            //String seleccionar = "SELECT * FROM usuarios ORDER BY id DESC";
            //ResultSet rs = stat.executeQuery(seleccionar);

            // Recorrer todas las filas de la tabla Motor
            //System.out.println("nombre\temail\n");
            //while (rs.next()) {
                //System.out.println(rs.getString("nombres") + "\t"
                        //+ rs.getString("email") + "\n");
            //}
        } catch (ClassNotFoundException | SQLException e) {
            //System.out.println("Error: " + e.getMessage());
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());

        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    Logger.getLogger(coneccion.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(coneccion.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
