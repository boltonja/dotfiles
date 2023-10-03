(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
(package-install 'xcscope)
(package-install 'powershell)
(package-install 'json-mode) ; https://github.com/joshwnj/json-mode
(package-install 'magit)
(package-install 'rustic)

