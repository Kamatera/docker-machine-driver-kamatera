module github.com/kamatera/docker-machine-driver-kamatera

go 1.14

require (
	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 // indirect
	github.com/Sirupsen/logrus v1.4.2 // indirect
	github.com/docker/docker v1.13.1 // indirect
	github.com/docker/machine v0.16.2
	github.com/pkg/errors v0.9.1
	github.com/sethvargo/go-password v0.1.3
	github.com/sirupsen/logrus v1.6.0 // indirect
	golang.org/x/crypto v0.0.0-20200510223506-06a226fb4e37
	gopkg.in/resty.v1 v1.12.0
)

replace github.com/Sirupsen/logrus v1.4.2 => github.com/sirupsen/logrus v1.4.2
