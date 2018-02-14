
"""
FILE: skeleton_parser.py
------------------
Author: 
Modified: 

Skeleton parser for CS360 programming project 1. Has useful imports and
functions for parsing, including:

1) Directory handling -- the parser takes a list of eBay json files
and opens each file inside of a loop. You just need to fill in the rest.
2) Dollar value conversions -- the json files store dollar value amounts in
a string like $3,453.23 -- we provide a function to convert it to a string
like XXXXX.xx.
3) Date/time conversions -- the json files store dates/ times in the form
Mon-DD-YY HH:MM:SS -- we wrote a function (transformDttm) that converts to the
for YYYY-MM-DD HH:MM:SS, which will sort chronologically in SQL.

Your job is to implement the parseJson function, which is invoked on each file by
the main function. We create the initial Python dictionary object of items for
you; the rest is up to you!
Happy parsing!
"""

import sys
from json import loads
from re import sub

columnSeparator = "|"

# Dictionary of months used for date transformation
MONTHS = {'Jan':'01','Feb':'02','Mar':'03','Apr':'04','May':'05','Jun':'06',\
        'Jul':'07','Aug':'08','Sep':'09','Oct':'10','Nov':'11','Dec':'12'}

"""
Returns true if a file ends in .json
"""
def isJson(f):
    return len(f) > 5 and f[-5:] == '.json'

"""
Converts month to a number, e.g. 'Dec' to '12'
"""
def transformMonth(mon):
    if mon in MONTHS:
        return MONTHS[mon]
    else:
        return mon

"""
Transforms a timestamp from Mon-DD-YY HH:MM:SS to YYYY-MM-DD HH:MM:SS
"""
def transformDttm(dttm):
    dttm = dttm.strip().split(' ')
    dt = dttm[0].split('-')
    date = '20' + dt[2] + '-'
    date += transformMonth(dt[0]) + '-' + dt[1]
    return date + ' ' + dttm[1]

"""
Transform a dollar value amount from a string like $3,453.23 to XXXXX.xx
"""

def transformDollar(money):
    if money == None or len(money) == 0:
        return money
    return sub(r'[^\d.]', '', money)

def makeitString(inputstr):
    temp = 0;
    quotes = [];
    inputstr = str(inputstr)
    
        
    for i in range(len(inputstr)):
        if inputstr[i] == '"':
            quotes.append(i);
           # print str(i)+"  in "+inputstr[i-10:i];
        elif inputstr[i] == '\"':
            print("sidal")
    for j in quotes :
        inputstr = inputstr[:j+temp] + '"' + inputstr[j+temp:]
        temp+=1

    
    return '"' + inputstr + '"'

"""
Parses a single json file. Currently, there's a loop that iterates over each
item in the data set. Your job is to extend this functionality to create all
of the necessary SQL tables for your database.
"""
def parseJson(json_file):
    with open(json_file, 'r') as f:
        dUser = open('Users.dat','w')
        # uID, Rating, Loc, Count
        dCate = open('Categories.dat','w')
        # Category
        dPrice = open('Prices.dat','w')
        # ItmeId, Firstbid, Buyprice, Currently
        dItem = open('Items.dat', 'w')
        # Itemid, seller Id, name, dscr, num of bids
        dBids = open('Bids.dat','w')
        # Itemid, buyerID, Amount, Time
        dTimes = open('Times.dat','w')
        # Itemid, started, end
        i = 1
        items = loads(f.read().decode("UTF-8"))['Items'] # creates a Python dictionary of Items for the supplied json file
        #print (items)
        for item in items['Item']:
            name = item['Name']
            category_list = item['Category']
            currently = transformDollar(item['Currently'])
            first_bid = transformDollar(item['First_Bid'])
            num_of_bid = item['Number_of_Bids']
            
            if 'Location' in item : location = item['Location']
            else : location = "NULL"
            
            if 'Country' in item : country = item['Country']
            else : country = "NULL"
            """
            if 'Started' not in item : print("no Started")
            if 'Ends' not in item : print("no Ends")
            if 'Seller' not in item : print("no Seller")
            if 'Description' not in  item: print("no DEsc")
            if '_ItemID' not in item : print("no ItemID")
            # do not print anything 
            """
    
            started = transformDttm(item['Started'])
            ends = transformDttm(item ['Ends'])
            seller_info = item['Seller']
            seller_id = seller_info['_UserID']
            seller_rating = seller_info['_Rating']
            description = item['Description']
            item_id = item['_ItemID']
            if 'Buy_Price' in item :
                buy_price = item['Buy_Price']
            else :
                buy_price = "NULL"

            
            i+=1;
            
            #print str(i) + "  "+ makeitString(description)
            dItem.write(item_id + "|" + makeitString(seller_id)+ "|"+ makeitString(name)+"|" + makeitString(description)+"|"+num_of_bid+"\n")
            #dPrice.write()
            dUser.write(makeitString(seller_id) +"|"+seller_rating+"|"+makeitString(location)+"|"+makeitString(country)+"\n")
            if num_of_bid != "0":
                for bid_info in item['Bids']['Bid']:
                    #print bid_info
                    dBids.write(item_id+"|"+makeitString(bid_info['Bidder']['_UserID'])+"|"+transformDollar(bid_info['Time'])+"|"+transformDttm(bid_info['Time'])+"\n")
                    buyer_info = bid_info['Bidder']
                    dUser.write(makeitString(buyer_info['_UserID'])+"|"+buyer_info['_Rating']+"|"+makeitString(buyer_info['Location'])+"|"+makeitString(buyer_info['Country']+"\n"))
                
           
            #dTimes.write()
            
            for e in category_list :
                dCate.write(item_id+"|"+makeitString(e)+"\n")
            dTimes.write(item_id +"|"+started+"|"+ends+"\n")
            dPrice.write(item_id+"|"+first_bid+"|"+buy_price+"|"+"NULL\n")
            # I am gonna calculate and insert Current value( which is the highest price) 
            #print started
            
            #print item
            

            """
            TODO: traverse the items dictionary to extract information from the
            given `json_file' and generate the necessary .dat files to generate
            the SQL tables based on your relation design
            """
            
        dUser.close()
        dCate.close()
        dPrice.close()
        dItem.close()
        dBids.close()
        dTimes.close()
        
"""
Loops through each json files provided on the command line and passes each file
to the parser
"""
def main(argv):
    if len(argv) < 2:
        sys.stderr.write('Usage: python skeleton_json_parser.py <path to json files>\n')
        sys.exit(1)
    # loops over all .json files in the argument
    for f in argv[1:]:
        if isJson(f):
            parseJson(f)
            print("Success parsing " + f)

if __name__ == '__main__':
    main(sys.argv)
