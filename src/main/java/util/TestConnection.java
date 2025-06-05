package util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        Connection connection = null;
        try {
            // Intentar establecer la conexión
            System.out.println("Intentando conectar a la base de datos...");
            connection = Conexion.getConnection();
            System.out.println("¡Conexión exitosa a la base de datos!");

            // Verificar que la conexión está activa
            if (!connection.isClosed()) {
                System.out.println("\nEstado de la conexión:");
                System.out.println("- Conexión activa: Sí");
                System.out.println("- Base de datos: " + connection.getCatalog());

                // Obtener metadata de la base de datos
                DatabaseMetaData metaData = connection.getMetaData();
                System.out.println("\nInformación del servidor:");
                System.out.println("- Nombre del producto: " + metaData.getDatabaseProductName());
                System.out.println("- Versión del producto: " + metaData.getDatabaseProductVersion());
                System.out.println("- URL de conexión: " + metaData.getURL());
                System.out.println("- Usuario: " + metaData.getUserName());

                // Listar las tablas disponibles
                System.out.println("\nTablas disponibles:");
                ResultSet tables = metaData.getTables(connection.getCatalog(), null, "%", new String[]{"TABLE"});
                while (tables.next()) {
                    System.out.println("- " + tables.getString("TABLE_NAME"));
                }
            }

        } catch (SQLException e) {
            System.err.println("\n¡Error de conexión!");
            System.err.println("Mensaje: " + e.getMessage());
            System.err.println("Código de error SQL: " + e.getErrorCode());
            System.err.println("Estado SQL: " + e.getSQLState());
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("\nConexión cerrada correctamente.");
                } catch (SQLException e) {
                    System.err.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }
}