#!/bin/sh
skip=38
tab='	'
nl='
'
IFS=" $tab$nl"
umask=`umask`
umask 77
gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }
gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }
case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�_\script.sh ]�wXSY�7�$!@(��C��ѻRz/�*IH��H�� ! E, �(�P�,�¨cGa����3�:�������y�}]��~k���^��Nj�?�w@@P�*���;��g8� %�?�����sZ�*��?|`u�����Ҫ����7햝q��lU�UH^�?s�%����w�9���ep3�X.����� /F+^��[�>��]�;�ܒ����`��j́Eq����Ҍ�0}�� 12/���6�t���^� )�v��g������ٹ��ٻ;�"#}bCV�/{e���*<n!	�s�w���OcpH�kw<��I��.)�/,<NVn�:! +f��4@*���X�(��-L�i�YE�o�6Hn>�0���]�F��Ͳ���o��o ��Ť<*�b=������5��,**� �s���(��B.���ޞX�A.�c�qI���9	i��`�e��=\������ ��hr�[�B�Zꖝ��K���%:�sBsY��v�Y5��u��ї��+`1�ة��^��3�Z��=��9�3��r6?/=+#�q|�6q�b1����j:�ڙ7��ID5bAf��J1�8/�,�I �*��ǳ̽ �g��J!l����E�"u�;�P�5Y�������\�v-T�,]6>��C��^����	�d�ݧ|�S�r�_ZjL)W�ke�܆@y_g|�*��`pۂ(�Y^�/���vb�kh�蘠�)�o#�S�" ���"�y�p`�'�ڔ���⡎���=������T��6>]�ǸE�yaJl�#^.���Ũ�^��0!%X��Hy�Њ�xL�~����"�3&l����:��pΒh��n7M��s�c�!d]�c��i\X��Y�����gB���-��2�|��r�u�m1��]cfI�,t޲�f�R-`��5ג��~�{z���x@�_QD����7��u�v�O��!Zu=�k�Bs�!C�Ҭ,�]{��b���!#�[���ش���#����3>c��h1��YníOyf��/����ˏ�`;
-M+�a��-�������0r}Y�����<�����������v������M�:�5������Vq��_�B|Od���/`�mԊfbg����N���O���x��;�xJ��<�c��S��(6Һ73Rإ]��k�^V�$O�����xq��r��q@P,9wD(�N��L�p5��^�.�����B�|��m�l>��ͳ���>Z��F����_(У����������ê�n�]�s���U�͜0tV��ނ�Q�.�J���݋��F»�y�EC�i�y����n��f�'�K� �U����߲�'nd��?%�0H�%��b��uٱ4;������{�b;4�4�Ϙ�=��S�Tm(�
�[��{�z��za'ط��Eqb��i��/:N|��s�[�w|K��E�O�M�[--�
t��\��n[lZ�0Йb�=qV&6IFFi��p�`���޳x��ƝOy��qL��Y#v�����9�O�{\�z�"B �S���OWb64G���[0�!i���Ϧ�c���b~X��r��T9�i�� ���BC~�e7�,���=�W����0���]��V��ڶ���7�K,gDۼ���7	�?_ 	�c�P};%���Z�]�pH����gUމE'�_:�P/]�<7f��Q�b`��Sa�hb��9��6<<�^	K}��c�J���#م<_�>�JX�_&���00!α�q~�6|h�[g}N.>%��'�n��5�rإ�x��Д�RfP�:��R�D��,^�	c��'XL�S�����1��Ml�>N�}�����K#��ѩSL-��r�@��:\oi���y�r��w��ӔWv�Ka�Z����bv"K�ӫ��~�s[no�p}A�Ә��޷�Vઈ���,ye�Z%@�n�ct̆T���~롾��')�1ёmN�7��.'9�t9��9��Wcz1�N���ԫ/�8�jP�ϕrԱ8�/q�X��Ta�?��7Y����)^�!_T�[���"��nMt�T1��,��߰�}�X���Z5i��9|�9w��t�E����C��O'���:���Y�"��� ��d��mࡹ,���C�\!���<�(�/���H���()k������<<#.���o#�ǣ|y�b�8Q�������d��y�I�0���N]���H3<ã$c��<y���9��7'(x����zq�a�{ؒA�����'|i����s��e���8�?�+>1�-��o��I������y���,{}r�����}���'�da���bw�:"I�X��\#�ƾ�z�X��K�C�_n��3�rK�jڜ�i��A3t#���7�[�P�u�'�Q֮���F�In��KS�!�R�9s���DH�N�HT��~�A`�l^�1z[N`Z�#ت{��ݔ�>11��ы	g�
��4�2G��Q�o���&ږ�A�0�Ƿ�<2�@Pr!ո?�w��;g���HZ%���nյcF	�J�@�_^���-�ʌ������̞B��CD��2�h^V��
x.�5�C��=b��yE>�N�a�Ӝ�h­�ћ��fn]st@���8�������7�ؘվnJЩC�l�5p�H��y��5b�v�.k:aZ/��W-��70	��l�����#c��^��}K}�/.�͏�֫CC?/<��8WU/g|���,vI쏄�3����7���Q�:��ƗϜG�+����͢��p�g����a�Ⳋ�!�N
z�s�d�M��]g_p���NI�hɮ�Ä�f30�v��s\��^![���n.ΘfW���{�rҬ���g��d��C���yn؜�y?�BԸ�\�>�\��y� ��;wq��O48�s7��u��5@o�q�Ǐ.���G�n��Y�4�o�^ߟ9����Y�����yq�tk9T����hq�]��o�����O���Nx�?k�����Ϫ��9�16��1�kZh��䡚�����M��'-;`��¾�9�:w���������h�[߭��9r�N:J�nڞt1x�qr�bw��17�HF�E+B��vg�勳�*�?�������ַ�Z?|`*q#r��m#���Fbup���nU�FGLF|���.i���1&2�=zv��`�b�Jc�B�Mo;4+�Ky�CC.G����������j��)f[�������k�}�J���������N3�8b�&]�Ju�0�,��GFr�ų�ZZL~�
]c�5�m໔0�b�Zl�G��%����=u#���A"h��Ǽl���s�~o��F��?���lm/��8D,��7�s��X����8G{��45�C�MҺ�v<Ma��uH?xx�<�Zv�N�>��՛��}�����3i7o��[g�$/g1�X��"�SB^>�����q5�ò�蚧�s�!LJ��o��׽k	�g��i��ȏux�Q}	,�x�����vH8��X*'��X��$�����(U�8���t���x7��bg�����[�%��KVY�5��W�y�2�5ݺ����uW%��i�� �~�:n�Fj$@߾-��O�>Tr�6���b�I�
�K�A��=���K���×Id�tK/����]�tm���Nzg�eƥ�-�A5�	�w�Q=Y%�����`�pW6�+9�,G��;����B�Y�d5̲<�ʈl��)vO܄n"�|����f�a���4y�>�^�|�e���U��O6���׉\�A�5����<���+/�Y�5%k�)[]���,޸C���^�-*ad��<��� �`(�#�LK�>o��'�̢��,n�7�tU�t�q'm�G�����ܐӼ�6�s�^�ZCĖ�-�:�����)��s��SU�w�3uu�EܽC��xYT�=T�����=�+&���I�xR���ղ�W�j�t^V�y��Zp����(��1����l��+�NO#w�����B��N��d�|�e=z���2� �����w��+���'�/Іf���Kݖ����8��-۠�,-���E,l��z��@��Z	���`K��<�Q�I�N|�H�|S�)L��'s����A�<0�)���a��\ �n�\"�rQTԦ�ҵ��Ǉ��Ʀ��y���(H0�P�_�yq��-�� B*��F�p����$�����W��Ùh}�:�4R1^�d�3�����)&�'��Ѫ���^����Ƌ �ON�%��,�)��Ĺ�GN����`��/��^6�D&e�\�M��X�J
�[F�8����r<F��0��k�q���N��m; ��P�MG8�<I�n��p�~�D���K����E@�����*��h`��V�[��Ӿ�r�eKU�~�<
��3�^�����Զ�u�S7�����f�-Բ{����/���UՑ�@��Dc-W�y�{?y~���ֶ��;�w��L;ҿ�ӎl�lx2�.�饨�w"�{?59�i���A����꣣h
���z��6���rz��8�d ��n>���$f�A�ָ��ۧsv�Dߥ�ڈ�s{:����~��o)�x S��n�{�m��}',z�����K�|<)ܕ��B��V�l��"�ҝ?!���>�:�Y�Y#w���K���}_���F.��R�~B�����;�+N;�ܭ�*�H���S�w�u�����I��y|�Je%,�Ee���=�F5����:0�Sq�̔��a��VK��B���̑pH$�Bu� iޙ/صA��:K��fN�� ��`bt��+�vmG�q��w��(#L������I3!�!��e�bb�K�M?,�Rs#��*���NƫW���jO�\8�v��c���..�3��>��?T��-v�<������-x����k�Nu���98�6�
�£��z��a�]����E�Ƥ���b]y��d�D1��C>�Y$��O��n0���]e�qc��1�]:��Z��ۡ���q�����YC�	�Tلڬ�f2G{����	փ���d�I�QT�����؈{��09�7�)a�����3�:���x� �"��Te*�Q�M�5�,��ی:--]��'��������?��/�/"ԁ���~�/��͈�
��I�:1�/�b�E�O_�1�ԆM������5;��*t@�EOOj�?��u[p�/Y�o�B�%=��jĶFT$� ����B��* �'<�	"��hA�� j�p�aC�b#t]-�--��/���P������7�Jʹ��EDb7lJ��8<�u�i��ݕ=�K�xD��1���Ӄ�{���sƳA��a*]S���`U���NN!r!�z),i6Y�AnI�;�i�򜨌#��y��[�[v���e҃F�ۛ���K�ش^}�}3���h�V����<��lj<a�OՍ��� �u�w��Wʸ"ŪI,4���2շL��-+�_i|�P�?�����b���VI����.H��q=&fh�Y�Μ�\�n�Nݤg�8o���j�dgTvXS���~~T�pW��F��1W��?z�;�mGŵ�!���t�?Qbx�5
lo$<W��t�U�Ѹ��Ѓk��&�-����R:�-�ye�j5��/D�鰜�5���Y\m�G��k�6�U�@!C#�TJ�-��s�o���<��R(HϢ���-B���U�<�I����fO�^�}q�@��
]�+�� ��^Qy�$\G�DX�Ukd�ߣe��!�|�[�X7P�q�ϑ�4�ɳ�Y���� ��Q��s$��X�P��S� �`u��/��� ���W�_.��V�H�1�D  > ��LgT;x�>9s����S��cm>�`k��I���Xl�Ԣ��Q��u���煺d���iPq���c��$p<t��^u3gǲlт{�F�ړ%��ɸ�T?�dK��o�|*�f�np��"%0vT����n,��4���`�����R߄E����>L�?o�Jŉm���	n���.�:�s��a����v���1���Y0���@*���#
�>���:�u���ʩV�Y �8L�
�)���wⱯ��QwO����F�����x#���|&��!2�����;�:�����qt �;��d�n��בovB\'�k_�>n��~:�����2AX�&�302��V(�I���կ� v���얪�DC`n��c՝7�Q`O�C���}��%�����.PQB]�w�aaְ���`^n��g��S4^��3�\ܧn�n�@��V-0�q2re��'�]#�,DK���||���#�s;"�h��ډG�G������$4���YnR��;�b �� �o���� x34^�r��`>�Zn-�~mk��<�j�?s&������|Y����g�$��i)�kH+�~�m��|ao�FK1�O_G��,8�OM�;���w�>���1�=�k�-׉D��:^^��c�;Dvu^���L�ȓ #��Z����M(�� �5��p��h�Nv� �QzѺ�a�������53�D��8l*ʊ_�����Վ�
��(I4���;��d��4�a��Ǿ�����u�MXj���
vЬ�w\�K���Uma�)��ﲆ,~2�5�*)H �z
Iw�������C~�p�-����-�Ƒ!���<���%Ca��%�6�৩'S?2i���#@-,=���4Nsԥw]0Fsc<�CL'PT����l�+�WT�C2��N퇥��]�k.�Ȯ�ۈWت��� S���G�TX5������l����6ڤc�����e�ߒ4�E�9��a��pîn�P���a��]_B��ʞ�8�e�2���`��َrJ*�,��р��:va����9x���������`(�h�{ޙg�X!�LX�W��`ݷ�7�WǹX<�L\p� E����>�v�2�RkbG!ϜJ��xF��X��iBYݖ�!�����fe�f��m����%�q�֓R��Н�0{�3��_��#�1~\�N��ѡRz�Ņ_����8'#I\L�:#Fg�Yij%Ƅ��o��W�G�s�=u4�wn�%�J����֗���}gDz���9�q��7Fi�po�dp�m����e���d"�b[�����ZM��ڃ�@׀�$r��o�T�\�8Q��ƹ������<5�&�U�
�.<6#$0�y���*��28e�ݛ��g2��nk&]��P�=��k��#����� mm#�tTk��͙�=��F��<��
�J��v������k�dOeRM�q=�M��4-L�诬��jFA�N��!m[�N.X@�׉^���UL���=��
�=�J��:U�2�g��s���^9�)rrx�A;��ƫ�Z.�2,�Dfޯ��ilI;cɯ�R����R�?B���`y�N�}�
b�f��ee�o<J���H]�++<kK�Q�>�u1\��\f�yv�W �h�l�R���	D�U�Y8�l4�^ch����gMQx�+s_d�T��No2�R��J4�?6�PY�es/4�(<P�o�nf�Z0������G��!��q� �d]��v"-�9����Уe:�t��?.|�}⦕
�t6�U�h���5��:��m�:�wX�rw"��[HM�h�g�?����@��.a�&d�q��Gw a�	�j��ۨȤ+����u~��p`OE�pZZDPB3�]1li�,�?����.s�L��U,$F_Y^�w0��gZ�k��f/w��`N��2��&���)�Q�4�"�y�Q��s�z�������DiC<0/M�T戡�!�i�_!�x��g5'�}op��C�S-}ܽ����'�{j����f%�:���M!��T��l�r�����[�0\�uW}L�������a�&���8���ț֮�򋀓�=4*S}���f�h�%ım��#Z����	���;v���蛻�X߂Xr�!��^�?6��`�9���r���KlLW�����~�\����+AA�V/.I�> Gw�ӵ� O��T�ЬT�ȠԸ�М��IP�v�Ug=I��K;�s��`XhlDu���,<|��K�A4��ׅ���S�T��t�l�;EDL$�J���Ī���j�9�9�r��#� 
���ux������^{x��T����l8~��nSΚ�V�Z��(�"HtF���A�g�h�Y&[��l��ց�s���4�"���go*~�u�b�4Ճg�%A��4cϧ�bښ_�B��rYw��(hK>�Ш�V|$��q�3:��w��:���%�mbQc�eB�d��b[)�R�)��von�v6��"�E�XA��8���R��b3��Q�

�Rᙊ�]��rߊ�m��^�g����"��k�^���+.rw>O�}����t݃��K�<\M;}ž���|��g �B��=De��I�'K�҈������sg T_�����Z��L���:�j4eV��Y�����x?$�t���ct:�s���������5�rn�k���R���%�焝�]����uI����Q�&��y����@'��w�~+���R�O"M��*hL�J��\�d5`'%�w�v����I㰄��M����i�:UV�*�z�̨������������Ƞ��##���Ǫ"C)73A+�(q1����t��OX�o��a�Z�q�_������G��y�Gx�-�wt�?�@��o8'�4[p4����NU5 �+q �z���f�e��ψ�Z��eǒ�Q����14��O�Ӵ�"Bk�I[t��o��`�d	/j������<���}j>��{�EN+o�v�=0Y�<���ē�p���J6����xhW;ޭ�Q��W;�N�l+�؞�Nb�.�#}v'
 �Se�zx��>��泷�������+����sq��1��6�W*_sp1�XS�
�̌S�r^e����W῵�	2�t^�>U�^Z��4
�Hp^���:���P�p�o��Zo ���5a�-��,��f�L����p�,���[�3H�̀�K:^��_Kt.�i�}{ܗY�������;��X�/C��Ġ�ʜ]��qy2�����h�qeZ�*�w!L�\%�;�c8W�k����܉�tF�u����!���&s�k�>������.=*h's#�����-�҄� �Fwz?���l��Ʃ�)�i���ЎI����UB���
}&�M8�lo����Q�q��H�V hE�z��F�����8jW��.ckk�"��æ5�s2�M�wH6�*E��B�!9��R#�B���eGǳeY���y6���?�|Ǭ.�O,�n�)����M����M�"`&ړ8�(���`��*�r�nꀽr�ce"��ދ���g�R� /u��9ػ����Y�\�G3(��P�^(�7�.TĨ���B>�I� ~Do�,Ȋ��oQ�G��K�b@NMzyM�����p�tz 8��jh�}�&���׳��W���9���tӎILk�t߯��ޑI�����M���_0���a����u�����,֟�<5BnK���1��Q��>�GX'�
C�4Ï*;�N ��j=�1ʨ�P�*Y�%��7�r�P���W�o����u�,4d�d����5���D�#=/7�ZY���|'G���ǜ�z3�eW���p��k�5zM;!0�?,�0��]��Pl%�����K����*ce�J�f��	Hhm�&��,����?-�J��K�44|��_���Gf�N�a6}��?Z�K�����.9Vs���7'2��"A�ػT�- �< ]�WOk�{2o�:��xG��Bn.-��p��S�{�f��JW'��.̵�/M���u�h�o�	㙺o1����{~3�� �_�@�c���^S��l�'�j���ۑ��l��/̱���ڐ��zj#t�oJ�x�+�����Ck��F*ֱ���D[��Re�_׵�Ч��ZZ$,r!�]�;Y�E��EXL̞�qa��%L8�v��הRO?iz���#�`��5X`[.�y������̝�J.teO;_�OR�$��q��8;����\��X<���se�᩶7�.�ZOځ'���j��sw��iMr���@� TO�����Q�>����W�%	���p��8�`J�ZS�5���j���d���7���ף��~�Ӗ�g����侰�!X�j����)���W�������>�?���L0���P���H���j`ZŚ5_�ɂx�^nV(�`&V\�	^¶��~����p�X����"p���^J�,vSp��	$�����ffq��,P���6ؚU�	e����x�]�N�1�J���|�$����M'汋 ܪ:��Oy����_PZ���YX�Yvnn�{�����4���%>�*���\va1�E\Օ2��sY'�Uz�����,@��lP�"�>���?�N���\1�����ˑʸ�{�{�Er޿�yn�ΎN��;��;�W$o�-�|��~���,��������H��D��}iQ� 	���U8!1ڇ&xM��JH��DGm���}T(����og�Ja;�?��'�t�'\��OH�ӫMݜ��#���(��(�(~���+�0O$��50��'��h��D?)	T]��G��z�_�mz���e�+��!�.�yݤ	�&Z�xB��h7WI���ޙ�V�^�)���/�I���3x��#is��7��"�kJ����D����O�eGq�;	.�)�.g�(U��b�R���xn�QU��$	{�U"^�4�$�]���e:P-Q����hS;�R*]P����^��*e���Z#���Y�@��V�����v�����
��<=���3"�.I�O�=Vnƀp��
�>�HM|/���*���?���c�~]�jFd��̉Ș�'?��q��z�:��j=�����,%x����ĽP��gU���.	[���E�j��V�)/�S���Q\I���.�S������NK�^@c��/E�Z���ZO��	��j��u�pq��v_��t�������D[
�ωܮ�����wK%JZ��ӣ:��ܪ�?J���YJ�ɐ�Mg��@���$�N̠�T�#e�k���W�S&�ɘ�����1��Tz^A}�5�P_ n�m-b������S-�d5ֳP_�:�eVܘ����e\�P�u)��8=e�$T��\y�;*���T��N��
�%��%\-˺�'��l�R�����[�V��_V��<u��(�5Lt�����6��oխo�Ƹ1u��:�཈Tâ\�"����R�m�67�4��`?�5�5JB����� J[	��'U0f}G���/�V�I]V���P�*�\y�MKk���kJ@�\m��X�{���2�,}��*�:UI�ݸ��*E�F|m�������j��[`����W���[)�q��ވ�,��z']�O���Т>Z#�q�ml�;���{�1�D����"����V��U9�+@ ������.  