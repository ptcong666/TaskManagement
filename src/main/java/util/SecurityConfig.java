package util;

import java.util.*;

public class SecurityConfig {
    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_DEVELOPER = "DEVELOPER";

    // String: Role
    // List<String>: urlPatterns.
    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

    static {
        init();
    }

    private static void init() {

        // Configure For "DEVELOPER" Role.
        List<String> urlPatterns1 = new ArrayList<String>();

        urlPatterns1.add("/task/*");

        mapConfig.put(ROLE_DEVELOPER, urlPatterns1);

        // Configure For "MANAGER" Role.
        List<String> urlPatterns2 = new ArrayList<String>();

        urlPatterns2.add("/task/*");
        urlPatterns2.add("/task");
        urlPatterns2.add("/team/*");
        urlPatterns2.add("/team");
        urlPatterns2.add("/developers");
        urlPatterns2.add("/developers/*");

        mapConfig.put(ROLE_MANAGER, urlPatterns2);

        // Configure For "ADMIN" Role.
        List<String> urlPatterns3 = new ArrayList<String>();

        urlPatterns3.add("/user");
        urlPatterns3.add("/admin");
        urlPatterns3.add("/user/*");


        mapConfig.put(ROLE_ADMIN, urlPatterns3);
    }

    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }

    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }

}
