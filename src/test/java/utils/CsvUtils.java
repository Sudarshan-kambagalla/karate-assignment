package utils;

import java.nio.file.Files;
import java.nio.file.Paths;

public class CsvUtils {

    public static String readCsv(String path) {

        try {

            return Files.readString(Paths.get(path));

        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}