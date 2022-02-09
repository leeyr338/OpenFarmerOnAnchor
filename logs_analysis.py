#!/usr/bin/python3

import os
import sys
import re

def run(logs_folder: str):
    key_word = "FWG 到"
    log_files = os.listdir(logs_folder)

    #数据形式 {account1: {date1: value, date2: value}, account2: {date1: value, date2: value}, ...}
    transaction_datas = {}
    
    # print(f"{log_files}")
    for log_file in log_files:
        with open(f"{logs_folder}/{log_file}", "r") as workData:
            for lineData in workData:
                 if key_word in lineData:
                     account = lineData.split(r']: 发送: ')[0].split(r'][')[1]
                     date_time = lineData.split(r']: 发送: ')[0].split(r'][')[0].split(r'[')[1]
                     value = lineData.split(r']: 发送: ')[1].split(r' FWG ')[0]
                     
                     # 是否已经存账号记录，如果存在，则直接增加转账记录
                     if account in transaction_datas:
                        transaction_datas[account].update({date_time:value})
                     else:
                        transaction_datas.update({account:{date_time:value}})
        workData.close()

    new_datas = sorted(transaction_datas.keys())
    transaction_file = open("transactions.log", "w")
    for key in new_datas:
        value = 0
        for date in transaction_datas[key].keys():
            value += float(transaction_datas[key][date])

        transaction_file.write(f"{key} : {value}\n")
        print(f"{key} : {value}")

        for date in transaction_datas[key].keys():
            transaction_file.write(f"   - {date} : {transaction_datas[key][date]}\n")
            print(f"   - {date} : {transaction_datas[key][date]}")
        transaction_file.write("\n")
        print("\n")
    transaction_file.close()

def main():

    logs_folder = "./logs"
    if len(sys.argv) == 2:
        logs_folder = sys.argv[1]
    run(logs_folder)

if __name__ == '__main__':
    main()
