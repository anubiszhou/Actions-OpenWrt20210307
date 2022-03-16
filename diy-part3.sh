#upload config
curl -fsSL git.io/file-transfer | sh
./transfer wet -s -p 16 --no-progress openwrt/.config 2>&1 | tee wetransfer.log
echo "::warning file=wetransfer.com::$(cat wetransfer.log | grep https)"
echo "::set-output name=url::$(cat wetransfer.log | grep https | cut -f3 -d" ")"
