SPEC integration/staging tree
================================

http://www.speccoin.com

- Copyright (c) 2009-2015 Bitcoin Developers
- Copyright (c) 2015-Present SPEC Developers
- Copyright (c) 2015-Present CryptoWatcher Developers

![Coin Image](/images/Spec256.png?raw=true "SPEC 256") ![Coin Image](/images/SpecDev256.png?raw=true "SPEC Dev 256") ![Coin Image](/images/SpecBip256.png?raw=true "SPEC Bip 256")

What is SPEC?
----------------

SPEC is a lite version of Bitcoin using scrypt as a proof-of-work algorithm.
- 5 minute block targets
- Subsidy halves in 840k blocks (~8 years)
- 3 billion total SPEC
- 1250 SPEC per block
- 4 blocks to Difficulty Retarget
- Max 132 Million SPEC minted per year (16 year POW) 
- Coin Abbreviation= SPEC
- Address letter= 5
- RPC Port= 4320
- P2P Port= 4319

SPEC is the native house token of CryptoWatcher.com, allowing trading enthusiasts
to watch the top 5 exchanges from one singular location. CryptoWatcher also
makes available services such as SMS/Text Price alerts and Chat and Live Chart Comparison
between exchanges.

For more information, as well as an immediately useable, binary version of
the SPEC client sofware, see http://www.speccoin.com

License
-------

SPEC is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

1 Click SPEC Node
----------------

From SSH (Tested on Ubuntu 14.x)

    wget -O specNode.sh https://raw.githubusercontent.com/SpecDevelopment/spec-wallet/master/AutoNode.sh ; sudo bash specNode.sh

The above ssh command was tested on an Ubuntu 14.10 machine. The AutoNode.sh script is meant to update the machine and install everything needed to run a specd from scratch, including auto start on reboot etc.

Also included in AutoNode.sh is cURL and php5 in anticipation of the user installing our optional "node status" frontend. (https://github.com/SpecDevelopment/specd-status)

Not guaranteed to work for your server setup.

Node Status Frontend
-------------------

Node GUI Demo http://node.speccoin.com & http://node2.speccoin.com

Available from https://github.com/SpecDevelopment/specd-status

![Node GUI](/images/NodeGUI.png?raw=true "Node GUI")

Simply download the contents of the above repo to your web directory of choice (Must be a public directory in order for others to veiw)

Copy/rename `php/config.sample.php` to `php/config.php` and configure your node's RPC credentials. The application will connect to your node via RPC and report statistics.

Change the contents of `php/config.php` to match your server ip/url and settings found in `~/.spec/spec.conf` (If you did not use the 1 Click Node setup, you will need to make sure you have a specd / [coin_name]d, php5 & cURL installed)

To use Google Analytics, simply create a file called `google_analytics.inc` inside the `php` directory and paste your GA code within.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the SPEC
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion with the devs and community.

The patch will be accepted if there is broad consensus that it is a good thing.

Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable.

[Tags](https://github.com/SpecDevelopment/spec-wallet/tags) are created 
regularly to indicate new official, stable release versions of SPEC.

Testing
-------

Testing and code review is the bottleneck for development; we may get more pull 
requests than we can review and test. Please be patient and help out, and remember this is a security-critical project where any mistake might cost people lots of money.


### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to 
submit new unit tests for old code.

Unit tests for the core code are in `src/test/`. To compile and run them:

    cd src; make -f makefile.unix test



Unit tests for the GUI code are in `src/qt/test/`. To compile and run them:

    qmake BITCOIN_QT_TEST=1 -o Makefile.test bitcoin-qt.pro
    make -f Makefile.test
    ./spec-qt_test

