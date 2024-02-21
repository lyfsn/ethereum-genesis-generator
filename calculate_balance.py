import json
import sys

def wei_to_eth(wei_balance):
    # Convert wei to ETH
    return wei_balance / 10**18

def calculate_total_balance(file_path):
    try:
        # Load the JSON file
        with open(file_path, 'r') as file:
            genesis_data = json.load(file)

        # Initialize total balance
        total_balance_wei = 0

        # List of accounts to ignore
        ignore_accounts = {}

        # Iterate and sum the balances of all accounts
        if 'alloc' in genesis_data:
            for account, details in genesis_data['alloc'].items():
                if account not in ignore_accounts and 'balance' in details:
                    balance_wei = int(details['balance'], 16)  # Convert hex to integer
                    if balance_wei > 0:
                        print(f"Account: {account}, Balance: {details['balance']} (wei), {wei_to_eth(balance_wei):.18f} ETH")
                    total_balance_wei += balance_wei

        total_balance_eth = wei_to_eth(total_balance_wei)
        return total_balance_eth

    except Exception as e:
        print(f"Error reading file: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_genesis.json>")
        sys.exit(1)

    file_path = sys.argv[1]
    total_eth = calculate_total_balance(file_path)

    if total_eth is not None:
        print(f"Total Balance: {total_eth:.18f} ETH")
    else:
        print("Failed to calculate total balance.")
