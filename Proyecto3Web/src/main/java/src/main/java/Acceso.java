package src.main.java;

public class Acceso {
    public static boolean access=false;

    public static boolean isAccess() {
        return access;
    }

    public static void setAccess(boolean access) {
        Acceso.access = access;
    }
}
