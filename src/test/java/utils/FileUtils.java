package utils;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

public class FileUtils {

    public static void writeJson(String filePath, String jsonData) {

        try {

            File file = new File(filePath);
            file.getParentFile().mkdirs();
            FileWriter writer = new FileWriter(file);
            writer.write(jsonData);
            writer.close();
            System.out.println("JSON file created successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void writeCsv(String filePath,
            List<Map<String, Object>> data) {

        try {
            File file = new File(filePath);
            file.getParentFile().mkdirs();
            PrintWriter writer = new PrintWriter(file);
            writer.println("userId,id,title,body");
            for (Map<String, Object> item : data) {
                writer.println(
                        item.get("userId") + "," + item.get("id") + "," + "\"" + item.get("title") + "\"" + "," + "\""
                                + item.get("body") + "\"");
            }

            writer.close();

            System.out.println("CSV file created successfully");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}