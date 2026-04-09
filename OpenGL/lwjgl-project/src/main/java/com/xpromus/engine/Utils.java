package com.xpromus.engine;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;

public class Utils {

    private Utils() {
        // Utility class
    }

    public static String readFile(String filePath) {
        String str;
        try (
            InputStream in = Utils.class.getClassLoader().getResourceAsStream(filePath);
        ) {
            if (in == null) {
                throw new IllegalArgumentException("Resource not found");
            }
            str = new String(in.readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException | IllegalArgumentException e) {
            System.err.println("File at " + filePath + " not found.");
            throw new RuntimeException(e);
        }
        return str;
    }
}
