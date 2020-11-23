package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class Main extends Application {

    public Controller controller;

    @Override
    public void start(Stage primaryStage) throws Exception{
        FXMLLoader loader = new FXMLLoader(getClass().getResource("sample.fxml"));
        Parent root = loader.load();
        controller = loader.getController();

        primaryStage.setTitle("Hello World");
        primaryStage.setScene(new Scene(root, 300, 275));
        primaryStage.show();
        controller.text.setText("DUPA");
        MyRunnable myRunnable = new MyRunnable(controller);
        Thread thread = new Thread(myRunnable);
        thread.start();
    }


    public static void main(String[] args) throws IOException {
        launch(args);
    }

    public class MyRunnable implements Runnable {

        private final Controller controller;

        public MyRunnable(Controller controller) {
            this.controller = controller;
        }

        public void run() {
            try {
                Socket socket = new Socket("localhost", 8000);
                while(true){
                    BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                    String serverMessage = reader.readLine();
                    controller.text.setText("");
                    controller.text.setText(serverMessage);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
