# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="k8s.io/helm"

MY_PV=${PV/_rc/-rc.}

EGO_VENDOR=(
"cloud.google.com/go 3b1ae45394a234c385be014e9a488f2bb6eef821 github.com/GoogleCloudPlatform/gcloud-golang"
"github.com/aokoli/goutils 9c37978a95bd5c709a15883b6242714ea6709e64"
"github.com/asaskevich/govalidator 7664702784775e51966f0885f5cd27435916517b"
"github.com/Azure/go-ansiterm 19f72df4d05d31cbe1c56bfc8045c96babff6c7e"
"github.com/Azure/go-autorest 1ff28809256a84bb6966640ff3d0371af82ccba4"
"github.com/beorn7/perks 3ac7bf7a47d159a033b107610db8a1b6575507a4"
"github.com/BurntSushi/toml b26d9c308763d68093482582cea63d69be07a0f0"
"github.com/chai2010/gettext-go c6fed771bfd517099caf0f7a961671fa8ed08723"
"github.com/cpuguy83/go-md2man 71acacd42f85e5e82f70a55327789582a5200a90"
"github.com/cyphar/filepath-securejoin a261ee33d7a517f054effbf451841abaafe3e0fd"
"github.com/davecgh/go-spew 782f4967f2dc4564575ca782fe2d04090b5faca8"
"github.com/dgrijalva/jwt-go 01aeca54ebda6e0fbfafd0a524d234159c05ec20"
"github.com/docker/distribution edc3ab29cdff8694dd6feb85cfeb4b5f1b38ed9c"
"github.com/docker/docker 4f3616fb1c112e206b88cb7a9922bf49067a7756"
"github.com/docker/go-connections 3ede32e2033de7505e6500d6c868c2b9ed9f169d"
"github.com/docker/go-units 9e638d38cf6977a37a8ea0078f3ee75a7cdb2dd1"
"github.com/docker/spdystream 449fdfce4d962303d702fec724ef0ad181c92528"
"github.com/evanphx/json-patch 94e38aa1586e8a6c8a75770bddf5ff84c48a106b"
"github.com/exponent-io/jsonpath d6023ce2651d8eafb5c75bb0c7167536102ec9f5"
"github.com/fatih/camelcase f6a740d52f961c60348ebb109adde9f4635d7540"
"github.com/ghodss/yaml 73d445a93680fa1a78ae23a5839bad48f32ba1ee"
"github.com/go-openapi/jsonpointer 46af16f9f7b149af66e5d1bd010e3574dc06de98"
"github.com/go-openapi/jsonreference 13c6e3589ad90f49bd3e3bbe2c2cb3d7a4142272"
"github.com/go-openapi/spec 1de3e0542de65ad8d75452a595886fdd0befb363"
"github.com/go-openapi/swag f3f9494671f93fcff853e3c6e9e948b3eb71e590"
"github.com/gobwas/glob 5ccd90ef52e1e632236f7326478d4faa74f99438"
"github.com/gogo/protobuf c0656edd0d9eab7c66d1eb0c568f9039345796f7"
"github.com/golang/glog 44145f04b68cf362d9c4df2182967c2275eaefed"
"github.com/golang/groupcache 02826c3e79038b59d737d3b1c0a1d937f71a4433"
"github.com/golang/protobuf 1643683e1b54a9e88ad26d98f81400c8c9d9f4f9"
"github.com/google/btree 7d79101e329e5a3adf994758c578dab82b90c017"
"github.com/google/gofuzz 44d81051d367757e1c7c6a5a86423ece9afcf63c"
"github.com/google/uuid 064e2069ce9c359c118179501254f67d7d37ba24"
"github.com/googleapis/gnostic 0c5108395e2debce0d731cf0287ddf7242066aba"
"github.com/gophercloud/gophercloud 781450b3c4fcb4f5182bcc5133adb4b2e4a09d1d"
"github.com/gosuri/uitable 36ee7e946282a3fb1cfecd476ddc9b35d8847e42"
"github.com/gregjones/httpcache 787624de3eb7bd915c329cba748687a3b22666a6"
"github.com/grpc-ecosystem/go-grpc-prometheus 0c1b191dbfe51efdabe3c14b9f6f3b96429e0722"
"github.com/hashicorp/golang-lru a0d98a5f288019575c6d1f4bb1573fef2d1fcdc4"
"github.com/huandu/xstrings 3959339b333561bf62a38b424fd41517c2c90f40"
"github.com/imdario/mergo 6633656539c1639d9d78127b7d47c622b5d7b6dc"
"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
"github.com/json-iterator/go f2b4162afba35581b6d4a50d3b8f34e33c144682"
"github.com/mailru/easyjson 2f5df55504ebc322e4d52d34df6a1f5b503bf26d"
"github.com/MakeNowJust/heredoc bb23615498cded5e105af4ce27de75b089cbe851"
"github.com/Masterminds/semver 517734cc7d6470c0d07130e40fd40bdeb9bcd3fd"
"github.com/Masterminds/sprig 15f9564e7e9cf0da02a48e0d25f12a7b83559aa6"
"github.com/Masterminds/vcs 3084677c2c188840777bff30054f2b553729d329"
"github.com/mattn/go-runewidth d6bea18f789704b5f83375793155289da36a3c7f"
"github.com/matttproud/golang_protobuf_extensions fc2b8d3a73c4867e51861bbdd5ae3c1f0869dd6a"
"github.com/mitchellh/go-wordwrap ad45545899c7b13c020ea92b2072220eefad42b8"
"github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
"github.com/modern-go/reflect2 05fbef0ca5da472bbf96c9322b84a53edc03c9fd"
"github.com/opencontainers/go-digest a6d0ee40d4207ea02364bd3b9e8e77b9159ba1eb"
"github.com/opencontainers/image-spec 372ad780f63454fbbbbcc7cf80e5b90245c13e13"
"github.com/peterbourgon/diskv 5f041e8faa004a95c88a202771f4cc3e991971e6"
"github.com/pkg/errors 645ef00459ed84a119197bfb8d8205042c6df63d"
"github.com/prometheus/client_golang c5b7fccd204277076155f10851dad72b76a49317"
"github.com/prometheus/client_model fa8ad6fec33561be4280a8f0514318c79d7f6cb6"
"github.com/prometheus/common 13ba4ddd0caa9c28ca7b7bffe1dfa9ed8d5ef207"
"github.com/prometheus/procfs 65c1f6f8f0fc1e2185eb9863a3bc751496404259"
"github.com/PuerkitoBio/purell 8a290539e2e8629dbc4e6bad948158f790ec31f4"
"github.com/PuerkitoBio/urlesc 5bd2802263f21d8788851d5305584c82a5c75d7e"
"github.com/russross/blackfriday 300106c228d52c8941d4b3de6054a6062a86dda3"
"github.com/shurcooL/sanitized_anchor_name 10ef21a441db47d8b13ebcc5fd2310f636973c77"
"github.com/sirupsen/logrus 89742aefa4b206dcf400792f3bd35b542998eb3b"
"github.com/spf13/cobra c439c4fa093711d42e1b01acb1235b52004753c1"
"github.com/spf13/pflag 583c0c0531f06d5278b7d917446061adc344b5cd"
"github.com/technosophos/moniker a5dbd03a2245d554160e3ae6bfdcf969fe58b431"
"golang.org/x/crypto 49796115aa4b964c318aad4f3084fdb41e9aa067 github.com/golang/crypto"
"golang.org/x/net 1c05540f6879653db88113bc4a2b70aec4bd491f github.com/golang/net"
"golang.org/x/oauth2 a6bd8cefa1811bd24b86f8902872e4e8225f74c4 github.com/golang/oauth2"
"golang.org/x/sys 43eea11bc92608addb41b8a406b0407495c106f6 github.com/golang/sys"
"golang.org/x/text b19bf474d317b857955b12035d2c5acb57ce8b01 github.com/golang/text"
"golang.org/x/time f51c12702a4d776e4c1fa9b0fabab841babae631 github.com/golang/time"
"google.golang.org/appengine 12d5545dc1cfa6047a286d5e853841b6471f4c19 github.com/golang/appengine"
"google.golang.org/genproto 09f6ed296fc66555a25fe4ce95173148778dfa85 github.com/google/go-genproto"
"google.golang.org/grpc 5ffe3083946d5603a0578721101dc8165b1d5b5f github.com/grpc/grpc-go"
"gopkg.in/inf.v0 3887ee99ecf07df5b447e9b00d9c0b2adaa9f3e4 github.com/go-inf/inf"
"gopkg.in/square/go-jose.v2 f8f38de21b4dcd69d0413faf231983f5fd6634b1 github.com/square/go-jose"
"gopkg.in/yaml.v2 670d4cfef0544295bc27a114dbac37980d83185a github.com/go-yaml/yaml"
"k8s.io/api 2d6f90ab1293a1fb871cf149423ebb72aa7423aa github.com/kubernetes/api"
"k8s.io/apiextensions-apiserver 898b0eda132e1aeac43a459785144ee4bf9b0a2e github.com/kubernetes/apiextensions-apiserver"
"k8s.io/apimachinery 103fd098999dc9c0c88536f5c9ad2e5da39373ae github.com/kubernetes/apimachinery"
"k8s.io/apiserver 8b122ec9e3bbab91a262d17a39325e69349dc44d github.com/kubernetes/apiserver"
"k8s.io/client-go 59698c7d9724b0f95f9dc9e7f7dfdcc3dfeceb82 github.com/kubernetes/client-go"
"k8s.io/kube-openapi 91cfa479c814065e420cee7ed227db0f63a5854e github.com/kubernetes/kube-openapi"
"k8s.io/kubernetes 2e809eed16445fff9dcbfc56e9936cf76ccbdadc github.com/kubernetes/kubernetes"
"k8s.io/utils 258e2a2fa64568210fbd6267cf1d8fd87c3cb86e github.com/kubernetes/utils"
"vbom.ml/util db5cfe13f5cc80a4990d98e2e1b0707a4d1a5394 github.com/fvbommel/util"
)

inherit golang-build golang-vcs-snapshot bash-completion-r1

GIT_COMMIT="2e55dbe1fdb5fdb96b75ff144a339489417b146b"

ARCHIVE_URI="https://github.com/kubernetes/helm/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
KEYWORDS="~amd64"

DESCRIPTION="Kubernetes Package Manager"
HOMEPAGE="https://github.com/kubernetes/helm https://helm.sh"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RESTRICT="test"

src_prepare() {
	default
	sed -i -e "s/git rev-parse HEAD/echo ${GIT_COMMIT}/"\
		-e "s/git rev-parse --short HEAD/echo ${GIT_COMMIT:0:7}/"\
		-e "s#git describe --tags --abbrev=0 --exact-match 2>/dev/null#echo v${PV}#"\
		-e 's/test -n "`git status --porcelain`" && echo "dirty" ||//' src/${EGO_PN}/versioning.mk || die

	rm -rf src/${EGO_PN}/vendor/*/*/vendor src/${EGO_PN}/vendor/*/*/*/vendor  || die
}

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}" go build -o bin/protoc-gen-go ./vendor/github.com/golang/protobuf/protoc-gen-go || die
	GOBINDIR="$(pwd)/bin" GOPATH="${S}"\
	go install -v -ldflags "-X k8s.io/helm/pkg/version.Version=v${PV} -X k8s.io/helm/pkg/version.BuildMetadata= -X k8s.io/helm/pkg/version.GitCommit=${GIT_COMMIT} -X k8s.io/helm/pkg/version.GitTreeState=clean" k8s.io/helm/cmd/... || die
	popd || die
	bin/${PN} completion bash > ${PN}.bash || die
	bin/${PN} completion zsh > ${PN}.zsh || die
}

src_install() {
	newbashcomp ${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dobin bin/${PN} bin/tiller
	dodoc src/${EGO_PN}/README.md
}
