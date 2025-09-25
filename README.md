# \# Market Volatility Prediction (News Tone → Next-Day VIX)

# 

# \## Author

# 

# \*\*Kwadwo Appiah\*\*   

# GitHub: \[nanafosu](https://github.com/nanafosu)



# > Graduate course project (Applied Data Mining CIS606).  

# > Predict \*\*next-day VIX\*\* from \*\*global news tone\*\* (GDELT) + \*\*volatility momentum\*\* using \*\*BigQuery ML\*\*.  

# > Reproducible end-to-end with Cloud Shell + SQL.

# 

# ---

# 

# \## ✨ Highlights

# 

# \- \*\*Target:\*\* `vix\_next` (next-day VIX close)  

# \- \*\*Features:\*\* `tone\_lag1`, `tone\_lag2`, `vix`, `vix\_lag1`, `dvix`  

# \- \*\*Model:\*\* `media\_vix.vix\_reg` (Linear Regression, BQML)

# 

# \*\*Hold-out metrics (2025)\*\*

# 

# | MAE | MSE | RMSE | Median AE | R² | Explained Variance |

# |---:|---:|---:|---:|---:|---:|

# | \*\*0.373\*\* | \*\*1.535\*\* | \*\*1.239\*\* | \*\*0.0569\*\* | \*\*0.956\*\* | \*\*0.956\*\* |

# 

# > Interp: The model explains ~\*\*95.6%\*\* of next-day VIX variance; typical error is small, with larger miss spikes on stress days.

# 

# ---

# 

# \## 📦 Repo Structure

# 



