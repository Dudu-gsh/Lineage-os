#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

CORES=$(( $(nproc) - 2 ))
(( CORES < 1 )) && CORES=1

set -euo pipefail


while [[ ! -f "$ZIP" ]]; do 
echo "Arquivo nao encontrado!"
funcao
done
path() {
  echo "Qual é a pasta que debaixo da parte (Extract proprietary blobs)"
fi
# Compila
croot
brunch "$CODENOME"
