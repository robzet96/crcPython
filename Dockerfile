# Użyj oficjalnego obrazu Python jako bazowego
FROM python:3.12

# Ustaw katalog roboczy w kontenerze
WORKDIR /app

# Skopiuj plik requirements.txt (jeśli istnieje)
COPY requirements.txt .

# Zainstaluj zależności
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj resztę plików aplikacji do katalogu roboczego
COPY . .

# Otwórz port 8000
EXPOSE 8000

# Uruchom aplikację FastAPI przy użyciu Uvicorn
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
