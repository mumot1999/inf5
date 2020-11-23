#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    socket = new QTcpSocket();
    socket->connectToHost("localhost", 9000);
    connect(socket, &QIODevice::readyRead, this, &MainWindow::readData);
    typedef void (QAbstractSocket::*QAbstractSoctekErrorSignal)(QAbstractSocket::SocketError);
    connect(socket, static_cast<QAbstractSoctekErrorSignal>(&QAbstractSocket::error), this, &MainWindow::displayError);
    ui->setupUi(this);
    ui->label->setText("HEJ");
}

void MainWindow::readData(){
    char buf[100];
    int n = socket->readLine(buf, 100);
    buf[n] = 0;
    qDebug() << buf;
    ui->label->setText(buf);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::displayError(QAbstractSocket::SocketError socketError){
    qDebug() << socketError;
}
