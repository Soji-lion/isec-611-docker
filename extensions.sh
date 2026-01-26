#!/bin/bash
set -e

cat > /usr/lib/firefox-esr/distribution/policies.json << 'EOF'
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "jid1-MnnxcxisBPnSXQ@jetpack": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi"
      },
      "{73a6fe31-595d-460b-a920-fcc0f8843232}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/noscript/latest.xpi"
      },
      "browsec@browsec.com": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/browsec/latest.xpi"
      }
    }
  }
}
EOF

echo "Extensions policies installed: uBlock, Privacy Badger, NoScript, Browsec"
