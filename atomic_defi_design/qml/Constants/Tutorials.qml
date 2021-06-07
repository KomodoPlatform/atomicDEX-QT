pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property var tutorial_list: {
        "portfolio": portfolio_help
    }
	readonly property var portfolio_help: [
		{name: qsTr(`WELCOME TO ATOMICDEX`),
        description: qsTr(`AtomicDEX Desktop is revolutionary cryptocurrency wallet where you can store your coins and tokens and make peer to peer trades using <a href="https://komodoplatform.com/">Komodo Platform's</a> <a href"https://developers.komodoplatform.com/basic-docs/atomicdex/atomicdex-api.html">atomic swap protocol</a>.An overview of your portfolio is available in the "Dashboard" tab, with a summary of your hodlings fiat price, fiat value and overall percentage. The "Wallet" tab  offers additional detail for each enabled coin, including transaction history, receiving address (in text and QR code format) and "send to" form for making payments. The "Addressbook" tab lets you save destination addresses for quick and convenient selection when making payments. The "DEX" tab is what makes AtomicDEX special. Here, you can create buy or sell orders for any enabled coin pair, or review and select existing trades listed in the orderbook. Being a DEX, there is no middle man - you keep sole control of your keys! Click here more info on <a href="https://cryptoadventure.org/beginners-guide-to-atomic-swaps-solving-the-centralization-problem/">how atomic swaps work</a> `),
        image: Images.tour_step1,
        reverse: true},
    	{name: qsTr(`LOT OF CRYPTO 200+`),
        description: qsTr(`Komodo's Atomic Swap protocol has evolved greatly since the code was written for the first swaps in 2014 between tokens on the NXT platform. Today, it is possible to trade between a great many coins including UTXO based (e.g. BTC, DOGE, KMD), Ethereum / ERC-20 tokens, QTUM / QRC-20 tokens, and BNB / BEP-20 tokens. If a compatible token is not in the default installation, you can even add it yourself thru a simple form in the app! The test Komodo smartchain tokens RICK and MORTY are available via an in wallet faucet so you can practice how to do an atomic swap without needing to add any coins of real value to the wallet.`),
        image: Images.tour_step2,
        reverse: false},
    	{name: qsTr(`SMART PORTFOLIO`),
        image: Images.tour_step1,
        description: qsTr(`As you navigate through the app, keep an eye out for the tooltip info icons to get some info about what the buttons do, and features available within AtomicDEX. If you have any questions, suggestions or other feedback, we'd love to hear all about it in the <a href="https://komodoplatform.com/discord">Komodo Platform Discord server</a> or the projects <a href="https://github.com/KomodoPlatform/atomicDEX-Desktop">Github repository</a>. `),
        reverse: true}
	]

    function getTutorial(page) {
        if(page in tutorial_list) {
            return tutorial_list[page]
        }else {
            return -1
        }
    }
}

