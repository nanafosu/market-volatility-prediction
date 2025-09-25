import yfinance as yf, pandas as pd, subprocess, sys
df = yf.download("^VIX", start="2018-01-01")[["Close"]].reset_index()
df.columns = ["day","vix"]
df["day"] = pd.to_datetime(df["day"]).dt.date
tmp = "/tmp/vix.csv"
df.to_csv(tmp, index=False)
print("Loading to BigQuery: media_vix.vix_raw")
sys.exit(subprocess.call(["bq","load","--autodetect","--source_format=CSV","media_vix.vix_raw",tmp]))