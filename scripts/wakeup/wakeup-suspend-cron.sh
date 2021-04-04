#!/usr/bin/env bash
# wake up and suspend ubuntu on the specific time.
# after running this script, and input " /usr/local/bin/suspend_until 8:40 ", computer will suspend and wake up in 8:40 am

CURRENT_DIR=$(dirname "$0")
TARGET_FILE="suspend_until"
ORIGINAL_PATH=${CURRENT_DIR}/${TARGET_FILE}
TARGET_PATH="/usr/local/bin/${TARGET_FILE}"

# add files  /usr/local/bin/
if [ ! -d "$HOME/bin" ]; then
  mkdir "$HOME/bin"
  # shellcheck disable=SC2016
  echo 'export PATH="$HOME/bin:$PATH"' >>"$HOME/.bashrc"
  source "$HOME/.bashrc"
fi

chmod +x ${ORIGINAL_PATH}
sudo cp "${ORIGINAL_PATH}" "${TARGET_PATH}"

# sudo crontab -e
# 11 34 * * 1-5 root /usr/local/bin/suspend_until 13:35 > /tmp/suspend_until.log"
