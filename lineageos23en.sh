#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

CORES="$(( $(nproc) - 2 ))"
CORES=$(( $(nproc) - 2 ))
(( CORES < 1 )) && CORES=1

set -euo pipefail


while [[ ! -f "$ZIP" ]]; do 
echo "File not found"
funcao
done
path() {
  echo "What is written above Extract proparitery blobs"
