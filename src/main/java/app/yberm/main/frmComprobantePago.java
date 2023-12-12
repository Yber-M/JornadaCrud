package app.yberm.main;

import java.sql.*;
import app.yberm.connection.Conexion;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author Yber-M;
 */
public class frmComprobantePago extends javax.swing.JFrame {

    frmMenu frmMn = new frmMenu();
    Conexion conex = new Conexion();

    // SQL
    Connection connec = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public frmComprobantePago() {
        initComponents();
        cargarFormaPagoEnComboBox(cbxFormaPago);
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

    public void cargarFormaPagoEnComboBox(JComboBox<String> comboBox) {

        try {
            connec = conex.getConexion();
            String query = "SELECT Nombre_FP FROM Forma_Pago";
            pstmt = connec.prepareStatement(query);
            rs = pstmt.executeQuery();

            // Limpiar el JComboBox antes de añadir nuevos elementos
            comboBox.removeAllItems();

            while (rs.next()) {
                comboBox.addItem(rs.getString("Nombre_FP"));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo cargar el tipo de pago.\nERROR -> " + e);
        } finally {
            cerrarConexiones();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlMenu = new javax.swing.JPanel();
        lblTitle = new javax.swing.JLabel();
        btnEditar = new javax.swing.JButton();
        btnActualizar = new javax.swing.JButton();
        jbtnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnReiniciar = new javax.swing.JButton();
        btnServicios = new javax.swing.JButton();
        cbxTipoComprobante = new javax.swing.JComboBox<>();
        cbxFormaPago = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txfSubtotal = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txfTotal = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txfIGV = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        cbxTipoServicio = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        txfCantidad = new javax.swing.JTextField();
        txfID = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        pnlMenu.setBackground(new java.awt.Color(36, 49, 94));
        pnlMenu.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblTitle.setFont(new java.awt.Font("Segoe UI", 3, 36)); // NOI18N
        lblTitle.setForeground(new java.awt.Color(255, 255, 255));
        lblTitle.setText("Comprobante de Pago (CRUD)");
        pnlMenu.add(lblTitle, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, -1));

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
        pnlMenu.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 400, 170, 50));

        btnReiniciar.setBackground(new java.awt.Color(51, 255, 255));
        btnReiniciar.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        btnReiniciar.setText("Limpiar Todo");
        btnReiniciar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReiniciarActionPerformed(evt);
            }
        });
        pnlMenu.add(btnReiniciar, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 630, 750, 40));

        btnServicios.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        btnServicios.setText("VOLVER AL MENÚ");
        btnServicios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnServiciosActionPerformed(evt);
            }
        });
        pnlMenu.add(btnServicios, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 670, 750, 40));

        cbxTipoComprobante.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        cbxTipoComprobante.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Boleta", "Factura" }));
        pnlMenu.add(cbxTipoComprobante, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 550, 170, 40));

        cbxFormaPago.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        cbxFormaPago.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        pnlMenu.add(cbxFormaPago, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 550, 210, 40));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("FORMA DE PAGO");
        pnlMenu.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 530, -1, -1));

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("TIPO DE COMPROBANTE");
        pnlMenu.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 530, -1, -1));

        txfSubtotal.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfSubtotal, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 510, 170, 40));

        jLabel6.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("S/");
        pnlMenu.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(760, 520, -1, -1));

        jLabel7.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("SUBTOTAL");
        pnlMenu.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 490, -1, -1));

        txfTotal.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfTotal, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 570, 170, 40));

        jLabel8.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("S/");
        pnlMenu.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(760, 580, -1, -1));

        jLabel9.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("TOTAL");
        pnlMenu.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 550, -1, -1));

        txfIGV.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        pnlMenu.add(txfIGV, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 450, 170, 40));

        jLabel10.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("IGV");
        pnlMenu.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(780, 430, -1, -1));

        jLabel11.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText("S/");
        pnlMenu.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(760, 460, -1, -1));

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("ID (CP000)");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, -1, -1));

        cbxTipoServicio.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        cbxTipoServicio.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jPanel1.add(cbxTipoServicio, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 40, 170, 40));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("TIPO DE SERVICIO");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 20, -1, -1));

        txfCantidad.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        jPanel1.add(txfCantidad, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 40, 70, 40));

        txfID.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        jPanel1.add(txfID, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 40, 100, 40));

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("CANTIDAD");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 20, -1, -1));

        pnlMenu.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 140, 400, 230));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(pnlMenu, javax.swing.GroupLayout.DEFAULT_SIZE, 977, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(pnlMenu, javax.swing.GroupLayout.PREFERRED_SIZE, 718, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed

    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnActualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnActualizarActionPerformed

    }//GEN-LAST:event_btnActualizarActionPerformed

    private void jbtnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbtnEliminarActionPerformed

    }//GEN-LAST:event_jbtnEliminarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed

    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnReiniciarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReiniciarActionPerformed

    }//GEN-LAST:event_btnReiniciarActionPerformed

    private void btnServiciosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnServiciosActionPerformed

    }//GEN-LAST:event_btnServiciosActionPerformed

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(frmComprobantePago.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmComprobantePago.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmComprobantePago.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmComprobantePago.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmComprobantePago().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnReiniciar;
    private javax.swing.JButton btnServicios;
    private javax.swing.JComboBox<String> cbxFormaPago;
    private javax.swing.JComboBox<String> cbxTipoComprobante;
    private javax.swing.JComboBox<String> cbxTipoServicio;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton jbtnEliminar;
    private javax.swing.JLabel lblTitle;
    private javax.swing.JPanel pnlMenu;
    private javax.swing.JTextField txfCantidad;
    private javax.swing.JTextField txfID;
    private javax.swing.JTextField txfIGV;
    private javax.swing.JTextField txfSubtotal;
    private javax.swing.JTextField txfTotal;
    // End of variables declaration//GEN-END:variables
}
