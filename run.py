from app import create_app

# Flask uygulamasını oluştur
app = create_app()

if __name__ == "__main__":
    port = 80  # Uygulamanın çalışacağı port
    print(f"Uygulama çalıştı. Port: {port}")  # Konsola mesaj yazdır
    app.run(host="0.0.0.0", port=port, debug=True)  # Uygulamayı başlat