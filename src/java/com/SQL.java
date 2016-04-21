/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author instrumentos2
 */
public class SQL {
    
    public static Connection connection= null;
    public static Statement stmt= null;
    public static String conecta= null;
    public static String us= null;
    public static String pa= null;
    public static Statement consulta= null;
    public static String url= "jdbc:mysql://localhost:3306/areagbd";
    public static String usuario="root";  
    public static String pass="root";
    //public static String pass="36490925";
    public ArrayList lista=null;
    
    public String conexion (String user, String password){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection= (Connection) DriverManager.getConnection(url, usuario, pass);
            stmt= (Statement) connection.createStatement();
            lista= new ArrayList();
            
            String query="SELECT `Nombre`, `Apellido`, `TipoUsuario`, `Estado` "
                    +" FROM `areagbd`.`usuario` AS `usuario` "
                    +" WHERE `Usuario` = '"+user+"' AND `Pass` = '"+password+"'"
                    + " AND `Estado`= 1";
         
            try(ResultSet rsp=stmt.executeQuery(query)){
            if (rsp.next()){
                
                for(int i=0;i<4;i++){
                 lista.add(rsp.getString(i+1));
                }
                if(lista.get(3).equals("0")){
                    conecta="Bloqueado";
                }else{
                    conecta="MySQL OK";
                }
            }else{
                conecta="No se conecto";
            }
        }
    }catch(Exception e){
        
    }
        return conecta;
    }
    
     public Connection getConexion() {

        return connection;

    }
  public boolean ejecutarSql(String consulta) {
        
        try {
            
            connection= (Connection) DriverManager.getConnection(url, usuario, pass);
            stmt= (Statement) connection.createStatement();
            stmt.executeUpdate(consulta);
            
        } catch (SQLException ex) {
            Logger.getLogger(SQL.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
  
  public ResultSet consultar(String sql) {
        ResultSet resultado;
        try {
            Statement sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }        return resultado;
    }
    
}
    

