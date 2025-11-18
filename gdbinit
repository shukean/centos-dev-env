python
import sys
sys.path.insert(0, '/opt/compiler/gcc-12/share/gcc-12.1.0/python/libstdcxx')
from v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
