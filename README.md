# myFitbit

Fitbit APIからデータを取得するRパッケージです。
自分の用途に必要な分（＋要望）にしか実装するつもりが無いのでmyFitbitとしています。

## Example

```r
library("myFitbit")
fitbit_token <- getToken("YOUR API KEY", "YOUR CONSUMER SECRET")

# 睡眠の統計値データ
getSleepdata("2016-01-27", fitbit_token)

# 1分ごとの睡眠状態データ
getSleepMindata("2016-01-27", fitbit_token)

# 体重データ
# 取得したい期間の開始日と終了日を指定（APIの仕様上31日間を超える場合は一度に取得できません）
getWeightdata("2016-01-18", "2016-01-26", fitbit_token)

```
