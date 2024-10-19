#!/bin/bash

## talkkonnect headless mumble client/gateway with lcd screen and channel control
## Copyright (C) 2018-2019, Suvir Kumar <suvir@talkkonnect.com>
##
## This Source Code Form is subject to the terms of the Mozilla Public
## License, v. 2.0. If a copy of the MPL was not distributed with this
## file, You can obtain one at http://mozilla.org/MPL/2.0/.
##
## Software distributed under the License is distributed on an "AS IS" basis,
## WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
## for the specific language governing rights and limitations under the
## License.
##
## The Initial Developer of the Original Code is
## Suvir Kumar <suvir@talkkonnect.com>
## Portions created by the Initial Developer are Copyright (C) Suvir Kumar. All Rights Reserved.
##
## Contributor(s):
##
## Suvir Kumar <suvir@talkkonnect.com>
##
## My Blog is at www.talkkonnect.com
## The source code is hosted at github.com/talkkonnect


## Set up GOENVIRONMENT
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/talkkonnect/gocode
export GOBIN=/home/talkkonnect/bin
export GO111MODULE="auto"

## Get the latest source code of talkkonnect from github.com
echo "installing talkkonnect with traditional method avoiding go get cause its changed in golang 1.22 "
cd $GOPATH
mkdir -p /home/talkkonnect/gocode/src/github.com/awasylew
cd /home/talkkonnect/gocode/src/github.com/awasylew
git clone https://github.com/awasylew/talkkonnect
cd /home/talkkonnect/gocode/src/github.com/awasylew/talkkonnect
go mod init
go mod tidy

## Build talkkonnect as binary
cd $GOPATH/src/github.com/awasylew/talkkonnect
go build -o /home/talkkonnect/bin/talkkonnect cmd/talkkonnect/main.go

## Notify User
echo "=> Finished building TalKKonnect"
echo "=> talkkonnect binary is in /home/talkkonnect/bin"
echo "=> Now enter Mumble server connectivity details"
echo "talkkonnect.xml from $GOPATH/src/github.com/awasylew/talkkonnect"
echo "and configure talkkonnect features. Happy talkkonnecting!!"

exit


