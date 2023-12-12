/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package app.yberm.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

import app.yberm.connection.Conexion;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Yber-M;
 */
public class frmEmpleado extends javax.swing.JFrame {

    frmMenu frmMn = new frmMenu();
    Conexion conex = new Conexion();

    // SQL
    Connection connec = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public frmEmpleado() {
        initComponents();
        MostrarEmpleadosTabla();
    }

    void LimpiarEntradas() {
        txfID.setText("");
        txfDni.setText("");
        txfName.setText("");
        txfApell.setText("");
        txfTelef.setText("");
        txfEntrada.setText("");
        txfSalida.setText("");
        txfID.requestFocus();
    }

    void ReiniciarPrograma() {
        LimpiarEntradas();
        btnGuardar.setEnabled(false);
        jbtnEliminar.setEnabled(false);
        btnActualizar.setEnabled(false);
        txfID.setEnabled(true);
        btnGuardar.setEnabled(true);
    }

    void activarBotones() {
        btnActualizar.setEnabled(true);
        jbtnEliminar.setEnabled(true);
        btnGuardar.setEnabled(false);
    }

    void desactivarBotones() {
        btnActualizar.setEnabled(false);
        jbtnEliminar.setEnabled(false);
        btnGuardar.setEnabled(true);
    }

    void cerrarConexiones() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (connec != null) {
                connec.close();
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al cerrar la conexión: " + ex.getMessage());
        }
    }

    private void BuscarPorID(String id) {
        try {
            connec = conex.getConexion();
            String query = "SELECT * FROM Empleado WHERE EmpleadoID = ?";
            pstmt = connec.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                txfID.setEnabled(false);
                txfID.setText(rs.getString("EmpleadoID"));
                txfDni.setText(rs.getString("DNI"));
                txfName.setText(rs.getString("Nombre_emple"));
                txfApell.setText(rs.getString("Apellidos_emple"));
                txfTelef.setText(String.valueOf(rs.getInt("Telefono_emple")));
                txfEntrada.setText(rs.getString("Horario_entrada"));
                txfSalida.setText(rs.getString("Horario_salida"));
                activarBotones();
                JOptionPane.showMessageDialog(null, "Se encontró al empleado -> " + rs.getString("Nombre_emple") + " " + rs.getString("Apellidos_emple"));

            } else {
                JOptionPane.showMessageDialog(null, "Vaya...empleado no encontrado. Inténtelo nuevamente");
                LimpiarEntradas();
                desactivarBotones();
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al buscar empleado: " + ex.getMessage());
        } finally {
            cerrarConexiones();
        }
    }

    void MostrarEmpleadosTabla() {
        DefaultTableModel modelo = new DefaultTableModel();
        modelo.addColumn("ID");
        modelo.addColumn("DNI");
        modelo.addColumn("Nombre");
        modelo.addColumn("Apellidos");
        modelo.addColumn("Teléfono");
        modelo.addColumn("Entrada");
        modelo.addColumn("Salida");

        String query = "SELECT * FROM Empleado";
        try (Connection conn = conex.getConexion(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Object[] fila = new Object[7]; // Asumiendo que tienes 7 columnas
                fila[0] = rs.getString("EmpleadoID");
                fila[1] = rs.getInt("DNI");
                fila[2] = rs.getString("Nombre_emple");
                fila[3] = rs.getString("Apellidos_emple");
                fila[4] = rs.getInt("Telefono_emple");
                fila[5] = rs.getString("Horario_entrada");
                fila[6] = rs.getString("Horario_salida");
                modelo.addRow(fila);
            }
            tblEmpleados.setModel(modelo);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error en la base de datos.\n" + e);
            
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlMenu = new javax.swing.JPanel();
        lblTitle = new javax.swing.JLabel();
        btnServicios = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        txfDni = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txfName = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txfApell = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txfEntrada = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txfID = new javax.swing.JTextField();
        txfSalida = new javax.swing.JTextField();
        txfTelef = new javax.swing.JTextField();
        btnEditar = new javax.swing.JButton();
        btnActualizar = new javax.swing.JButton();
        jbtnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnReiniciar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblEmpleados = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setLocationByPlatform(true);

        pnlMenu.setBackground(new java.awt.Color(36, 49, 94));
        pnlMenu.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblTitle.setFont(new java.awt.Font("Segoe UI", 3, 36)); // NOI18N
        lblTitle.setForeground(new java.awt.Color(255, 255, 255));
        lblTitle.setText("Empleados (CRUD)");
        pnlMenu.add(lblTitle, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, -1));

        btnServicios.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        btnServicios.setText("VOLVER AL MENÚ");
        btnServicios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnServiciosActionPerformed(evt);
            }
        });
        pnlMenu.add(btnServicios, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 700, 750, 40));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("ID (E000)");
        pnlMenu.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 140, -1, -1));

        txfDni.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfDni, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 160, 150, 40));

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("DNI");
        pnlMenu.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 140, 70, -1));

        txfName.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfName, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 160, 210, 40));

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Nombre");
        pnlMenu.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 140, 80, -1));

        txfApell.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfApell, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 160, 230, 40));

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Apellidos");
        pnlMenu.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 140, 160, -1));

        jLabel7.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Hora de salida");
        pnlMenu.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 210, 110, -1));

        txfEntrada.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfEntrada, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 230, 170, 40));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Hora de entrada");
        pnlMenu.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 210, 150, -1));

        jLabel6.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Telefono");
        pnlMenu.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 210, 120, -1));

        txfID.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfID, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 160, 100, 40));

        txfSalida.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfSalida, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 230, 170, 40));

        txfTelef.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfTelef, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 230, 180, 40));

        btnEditar.setBackground(new java.awt.Color(255, 255, 102));
        btnEditar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        btnEditar.setText("EDITAR");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });
        pnlMenu.add(btnEditar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 240, 50));

        btnActualizar.setBackground(new java.awt.Color(102, 102, 255));
        btnActualizar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        btnActualizar.setText("Actualizar");
        btnActualizar.setEnabled(false);
        btnActualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnActualizarActionPerformed(evt);
            }
        });
        pnlMenu.add(btnActualizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 70, 240, 50));

        jbtnEliminar.setBackground(new java.awt.Color(255, 51, 51));
        jbtnEliminar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jbtnEliminar.setText("Eliminar");
        jbtnEliminar.setEnabled(false);
        jbtnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbtnEliminarActionPerformed(evt);
            }
        });
        pnlMenu.add(jbtnEliminar, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 70, 240, 50));

        btnGuardar.setBackground(new java.awt.Color(102, 255, 102));
        btnGuardar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        pnlMenu.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 220, 170, 50));

        btnReiniciar.setBackground(new java.awt.Color(51, 255, 255));
        btnReiniciar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        btnReiniciar.setText("Limpiar Todo");
        btnReiniciar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReiniciarActionPerformed(evt);
            }
        });
        pnlMenu.add(btnReiniciar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 660, 750, 40));

        tblEmpleados.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(tblEmpleados);

        pnlMenu.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 280, 750, 370));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnlMenu, javax.swing.GroupLayout.PREFERRED_SIZE, 791, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(pnlMenu, javax.swing.GroupLayout.DEFAULT_SIZE, 754, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnReiniciarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReiniciarActionPerformed
        ReiniciarPrograma();
        MostrarEmpleadosTabla();
    }//GEN-LAST:event_btnReiniciarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        String EmpleadoID = txfID.getText();
        int DNI = Integer.parseInt(txfDni.getText());
        String Nombre = txfName.getText();
        String Apellidos = txfApell.getText();
        int Telefono = Integer.parseInt(txfTelef.getText());
        String Hora_Entrada = txfEntrada.getText();
        String Hora_Salida = txfSalida.getText();

        try {
            connec = conex.getConexion();

            if (connec != null) {
                String insertar = "INSERT INTO Empleado (EmpleadoID, DNI, Nombre_emple, Apellidos_emple, "
                + "Telefono_emple, Horario_entrada, Horario_salida) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                pstmt = connec.prepareStatement(insertar);
                pstmt.setString(1, EmpleadoID);
                pstmt.setInt(2, DNI);
                pstmt.setString(3, Nombre);
                pstmt.setString(4, Apellidos);
                pstmt.setInt(5, Telefono);
                pstmt.setString(6, Hora_Entrada);
                pstmt.setString(7, Hora_Salida);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    JOptionPane.showMessageDialog(null, "Datos guardados correctamente");
                    LimpiarEntradas();
                    MostrarEmpleadosTabla();
                } else {
                    JOptionPane.showMessageDialog(null, "No se pudo guardar los datos");
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al guardar datos: " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void jbtnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbtnEliminarActionPerformed
        String EmpleadoID = txfID.getText();

        try {
            connec = conex.getConexion();
            String sql = "DELETE FROM Empleado WHERE EmpleadoID = ?";
            pstmt = connec.prepareStatement(sql);
            pstmt.setString(1, EmpleadoID);

            int confirmacion = JOptionPane.showConfirmDialog(null, "¿Está seguro de que desea eliminar este empleado?",
                "Confirmar eliminación", JOptionPane.YES_NO_OPTION);
            if (confirmacion == JOptionPane.YES_OPTION) {
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    JOptionPane.showMessageDialog(null, "Empleado eliminado correctamente");
                    LimpiarEntradas();
                    activarBotones();

                    txfID.setEnabled(true);

                    MostrarEmpleadosTabla();
                } else {
                    JOptionPane.showMessageDialog(null, "No se pudo eliminar el empleado");
                    LimpiarEntradas();
                    desactivarBotones();

                    txfID.setEnabled(true);
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al eliminar empleado: " + ex.getMessage());
        } finally {
            cerrarConexiones();
        }
    }//GEN-LAST:event_jbtnEliminarActionPerformed

    private void btnActualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnActualizarActionPerformed
        String EmpleadoID = txfID.getText();
        int DNI = Integer.parseInt(txfDni.getText());
        String Nombre = txfName.getText();
        String Apellidos = txfApell.getText();
        int Telefono = Integer.parseInt(txfTelef.getText());
        String Hora_Entrada = txfEntrada.getText();
        String Hora_Salida = txfSalida.getText();

        try {
            connec = conex.getConexion();

            String sql = "UPDATE Empleado SET DNI = ?, Nombre_emple = ?, Apellidos_emple = ?, "
            + "Telefono_emple = ?, Horario_entrada = ?, Horario_salida = ? WHERE EmpleadoID = ?";
            pstmt = connec.prepareStatement(sql);

            pstmt.setInt(1, DNI);
            pstmt.setString(2, Nombre);
            pstmt.setString(3, Apellidos);
            pstmt.setInt(4, Telefono);
            pstmt.setString(5, Hora_Entrada);
            pstmt.setString(6, Hora_Salida);
            pstmt.setString(7, EmpleadoID);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                JOptionPane.showMessageDialog(null, "Datos actualizados correctamente");
                LimpiarEntradas();
                activarBotones();
                txfID.setEnabled(true);
                MostrarEmpleadosTabla();
            } else {
                JOptionPane.showMessageDialog(null, "No se pudo actualizar los datos");
                LimpiarEntradas();
                desactivarBotones();
                txfID.setEnabled(true);

            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al actualizar datos: " + ex.getMessage());
        } finally {
            cerrarConexiones();
        }
    }//GEN-LAST:event_btnActualizarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        String id = JOptionPane.showInputDialog(null, "Ingrese el ID");
        if (id != null && !id.isEmpty()) {
            BuscarPorID(id);
        }
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnServiciosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnServiciosActionPerformed
        frmMn.setVisible(true);
        dispose();
    }//GEN-LAST:event_btnServiciosActionPerformed

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmEmpleado().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnReiniciar;
    private javax.swing.JButton btnServicios;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton jbtnEliminar;
    private javax.swing.JLabel lblTitle;
    private javax.swing.JPanel pnlMenu;
    private javax.swing.JTable tblEmpleados;
    private javax.swing.JTextField txfApell;
    private javax.swing.JTextField txfDni;
    private javax.swing.JTextField txfEntrada;
    private javax.swing.JTextField txfID;
    private javax.swing.JTextField txfName;
    private javax.swing.JTextField txfSalida;
    private javax.swing.JTextField txfTelef;
    // End of variables declaration//GEN-END:variables
}
