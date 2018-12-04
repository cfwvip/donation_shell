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
���\script.sh ]�T�Y�6�� i@��7!�Tz%��HI �&	�)#�)
b/��"����mƂM��(:c�|����?k���˽�9�������VZh �π��@�ڎ
v��p*���jS��SH����2�9�<�T���m��+��1q-�e�k��N�-����+KRJf�K���rY9.��t��نg�?�=3�g�Żg�v3͕���ֳ�d󏔄��F������G�L��J��L�93@�T;�gwvP<�(N^.��hz�R�y�,/�@](�#�0���H\~*�KҶ����/J�(����#��L^&��
����JD* ���Z66@O//��e�����_��ʱ�䧒��iN_��V�f5��) �и��ul��߾�3V�0�m�����2��{��L��	���NNĂtrq;G@�����S�A�� o����gz+��?}�1 �� ��S*��0��bϬ� a�z�0�9��cg [��ʡ��Gn.~loa.���I^/��x��	$�� M/�Щ��~�������d֑�$ǄG#,R!���4��So�oZ����܌\W�J�rX��"�]&;GhX� X2���J"l���K�^�<y����9/Y84�j��}nG�l���yӳz?������~*�L��W>�,E��&G<;{�f ����/�,q�98�4�'���i���+0��1��G�2ޭO^Ѹp�M��G��9�@��� �ӯ�{����3Һ���s�*��kH.��zF��`�Y�!�VJA����K= Y�8`�4����%�ͯ�_��ݰaCF�����ٳ�D[�4�T�T�(ŭ3��]�w�;�y��)\X��3�[�1-Yn��G.�װj�����3�d�۴o���E�-Z�Hb7�ۦ- ��{���ͮ�:���hT7�������s���%%ca�z'̲R��\�L�t�Mbsц�g��g��vqf�cՎ0��R�gc�P�5cRntj��,���4���Ok���tX����q���9�Jm�}��q�O���
�:|������MA,����Kޣ�C��s�]�\�<>9o������oNi[Բg�������$~��V!�����ك��b�(����n1�O��z��M�\������j����D]�&�k#+n5_u|��s�L:+{��l��O���|M�\�Ӡ�h2oH��AL�H��0�������4rv���~�R��_��fؙ99�m=�#�ÃN�N��Տ�@��$�ɖ��U�$	�[��q�}+\�Lv�����I��B���ms���&�. @CfSRK�ۢޣmB�i��6ӛ�SA�;���\sb&�a_i�./3��G�x��M�����`�V� 登����!k�8�_�7��du^�Z:�Vs�[��f�N?�(�f]�$FjΛ22J����I;���x����
1>7g����Zhk�7���u�������ٶ����_�*����Vb +=�4?:�?�#�����F��	!�����L�%ΉsⅦ��d����X`]��`6�z��DvuK�I�	��zmE���u�����>9Ypo���M�!��d�Z�k�۸+R��
�����D��{j��T�q����҆\�G��>��#����)���~�X<�rtv7�w����۪g���������h�¾ó�s�g�V,r�{�vc7�������w\�i��;2ҫ�����R�*�;y���̉Jqe�"1$���q.����C��}6�q\�lv]�߀I�,��S�<�9�x�anbhR󧆔�"dʁ�D_���8�+֜/����S�QcU�Dq��sRvr���0�&�G��>'��z�f[q�+q9��m�-S�͖o>u"�5�f1�[�^��p؆_^�a����z
�6��O���z��ف+�E�^fd**"4+ u�-�R5���=�z��bDt-�r��b��{�3��BTC�ӿ�5w�Cw%_|U�-�TS�Z�%g��d�&Ju,��%��z�����^�K��p��Me�e/{�۷���%�U��j
�B�L�fC��Y�����N�1io��WU"�t(����4��UN��ͪn�,�i>� m�R��_�a�=P"��xbm�i'o�J���ݩ�!�N)��lS��������{�揔�)�7���uk���|�Y>���^��vx�wQ��Q(y��N{����\�{W0iU�j�m�mЖE��|z�>?tb����6��{g?O���G'�jyS3�#�L�dO�ۅ�:���~H�1;B�۹�;W�ys?M����)���z1WI�Ċ�R��Xέ�ю�3��	��܌.O���5�t�S�sg��5)���l�>!�p����5�)Z�f��M�V��=+[����<N
���x�.������X[[��$),�ϻ�b�����*��-Vn8�u�=&5W�?��<cH��������Xd� �b�G���?�L�� �ո��61gM�T�7T���Ӆz�Ɓ��o�t��y?��c}Fn��B�7t��t�%�#bN�@%3�z��x���$ld��n߁H���%�i/�[z2��r��>�F����K�����ȅ�1��Ny+�ǵ�9��}�$���9�vOOҮ_����{�6{*~J?�ؿZ<��_z"t���}3�v�)o����m5rpf�?����`n������z�[,�d�\���@h)�\����`_?�����W���K��^y�
���2����ڃ�8����b��z�x�.
V���iICfl�� !���BOu4�S���w�9
��TKA������mK���u��e{7����]�a�W���9'�d�|<9�kՁ�{���H���dp!�VC�0�}9M�;'2���Yq��+�K�w�����;D��˘�q/���ݿ1;4,=8��TM���)�冻��J��_�j0�K=�������^�xöVv]F�z�Ԥ���V�ut����oq;���a6O�vZ2۱�hK�S�[F5oۅ��Z=���3�ܦK��{`�V�������Uֱֹ�]�^����F��[ܤc����*	�)�í��w��}=a�d�$Va����(��D��X��a��fCL�l��#�7dԭа���O�N虻�\_2n-�h�i���n���0A<�����}lj��Y�+Z���T��<wT��v��zx�Fm�1�j�NJ�#�\��D����>�����^{���8�Q�oL���^��9�#��X����m�{��z2�O n���VޭZ��`��$*]
@	����e�6%Ԁq�Ã��>���5s�Vm�у�U��m�C�5:��h�(}tv�Z��N~hfWg�,�52(�o��/�&���/���UȞl�LAXI��ͬs��#��|�H��ʒ�Q�Dԣ�_��4,�˻��+V���0����|��0����y|�����{01_J2t�W<�:��9�6�<�����[�=�x<�բ��5����cfIP�����l����}�6���*�&����H̀k�)������݉ڐ�y��}��0N :�Z���_�y��.Oc�4m}@���R.�kwiZ�*����W���O���S5
�P-ˆ�Cv�<��o��訪\`fu`���ށrZ@ř������uǯg!�f����ڊt7�0����پ ��z�����
@������ރ��~?�P������r�����X��R�o~9�_�J��CnϮ�����o��^�I���q9�h�)(����;���,+�v��꓿�óH�@�*)��p�b�#�WIo��$p��a�������}Xw�Td���aQj�v����G=z�xR��
���+�'��Aܜ�d�|�K���ыrC��b�4'���A|x#E_�7��y��"��Z� 1���8�,�I��EÉRbZy� �#��C�Hٝ��ǼN�u�r�{N;�B�`z�VKQ����3I�H6aYl5+�dX)$��� LB"7l(��3�6�*�a�8�&loW�5%����jw$���7|V�*:=��
�S��& @+ON�ߜ�>��bT}P�눎N�K]�"R�C���/WBR_�;�d�lYy
#�����l�����^�\ 5b�wef#a)�X�x�$�T�׬�&9W�P�+}�j��h��[�����!�#���R�PR�3�����\�.�A�������[�X�����x�m���d�����6S��앁�4�lw���;p��Қseиq��nz���u�T���j���a�����<�ƨ]��\���y4�l���ܮ�]�|C��hH���`2�R��Igh�����E|H;�w���;">�����!����4TVG�Ӯ~�i�4Č���f���sp���ƙ���w}#�U����7+[b�5/H��G�i���O�W��"g�D#��bhc��7�/Z�w���'���m�?�DMՎ�T�H��p����?*�����ޖh>e�'���%:um���Fp%���u�q+��)�L�Zk<1.��\��O��L��W���݄"Ө�?\�gD=;_U=?*�/�)�n���P,Z�w�������;�f���� W���?�+�
�LS�ċ�?L?e�|"ʹyҠ��}��C'����"Rx�P���!��xgp;�))�M��Ԃp����pH�h}i�-��-M0�y&����"c��Q
�<r��v{�ņ�xX�1p(*T'�d���L��Z%k�[b*����iP7�b�b�����K��GV<w|?nmQ�%t�w	�������	q�6�X�s� $��L����,:'����bV�H��
���n'F&/[0��s��+$��E�F]���w�U�|dw����6��J<��BY��I�}�	�iE�aUe����2	��`ڀoܻv��{t�s+z@7�W��z����Y2�0�ێ���q�B��2l�`i��|;ҵ�+�Y�	�\�0f�j� �t�5v|��1TG���Ɠȭ�jT1Im<\�~#`ؠ�c˄��iik�so2�HG�~ ��0���>h�G"1��rS6�[���7��'�<&�}�5�71���)'���M�K)�5�@�׌	�zȪ�~Z %�a�*ں@D����?~�L����R-��j�צ�g�[�ݡvA���Je4�
D0�c�CiA�(`]���^��t���Z��~�<oL T�����c��7��EX�^��V����w�v#����5�a�����	ᰖ3؁�޹��t�
㇃е^gs���`� WW���8#)���8�"d�7Ż�D�@m��W�.��T�gbO�춣{�}&<~�$��(�ۃ����T\LH�q���ɹ=�4T6�XC�?�-�'��7���Dp���,P�M�6����f^X�jXjZh�+�BO�����=�^�v]!Xq�ޱ��g.m)��D�?�?�Y���N[�o��$sxdK����ߟ&w��5
� ���r���n]��ó?�z������Ƥ�#FP���������/{Mӎ�0������V���j/@q5_���,-,
�l�Bl��Op)�B��'
=�2���몇ny��������7W�2��[+P��2��L�"��^Y9��-Eȭ����v�_��]:��Il��D���,LcN��`���Uki�.إ{%��E�Wf�����/�1y/'ϰ� x��U C�p��1?_8/��B-v	 1���x���B��ed��P��!?�L��u�k3����V��0C����g�e+�+�dS��CG�y��ݯ��MY.�V`C�?}�Q��[pg69|�ʌc�ŹX���I`S['
��$U�1�k(�,щ�ڀ{��U���o���6!\�4C%�=��%����I�߰U��n�M���e~�/㑁q�Yd��ڌ=7���P��!��ctp/�<�m=�����|q�2fk�[��\=w�YE�A}�l(>㧰z��|�Ř�n?dOT( R��E��L"��K��~z@{�ת5�6�r8��?���8��"�8����!"]zNmP<�ø�A�c��q����X� �}�Q��-=��S�V�u->*�i�e쯀%�jƈ�N�����<���RHz�c2-�q9U`�i��[���`�B3S ����$�Ϋ3��!S��{r���{y���������/	�H�!�'tRíwmi�!�'c �?�c�V?<�Uř16^��X�ڞk�%�%X21�)D2���G�wXo�� ~�C'�m��S�p����Ih,6n	8o�s�p�7g4u�8(l�.�w��<�;F+�U��x�}�YV�v:�o=Nf����J��I�$�é�����8A �+N�b�wL*�\�-.���)�!�㤍��������'�h�r��kO�O`��y�	s2V�J�#r�s�@�{�,���A0��/7Kh��7-A5��fi�/��=,f��L�~�k�#!@}�#C�o*�4L�v�_���GN�iv $�#C�1���7hky�-��Qf-�u���8%����v�$jm6�0��L�}��������$m���#`�8h�1�1�=��DfL��F���(�p��{�M�b{ɌW_��tZۖe�u=M�R��-��*�7NnJP77^{�Ӿu���{Ϛ�W�b�.1�s��I�f��I��n�(
�0��@Ϗy�a@p'F� �: 0��h2ܤm�D<��_��sL,�s��;�ۇ�K��n����r�l���DR��Op����Aנt�|����=�n�=?���i��W"(1�������Z��Ӑ�8q���[���WR�wzk����u��d� �Y��h/,Z�]Q�΁�p���|�����h�����;g�k)ֆ�س��j�<�(�)���G��^��6>A(9�tdb�F��7���SP�K~���4j�r٪S��D��z�'��D�\��]�'��y��xth���1̔Jc���'J���.�Dn��'W`�p'j\�b�l����1�'�=��bټ\��MI��Y_k��ਚF6k����k"��h�W���"����[��g \g���nڭ}�&�d����*�G���N���-�����&s��Y�u�˕m��H���{k��R�9�Yc���tnIVW�cVv/.iI��ō}oh�Y�5��-,��-��x���=�?"	��{�7	3�p���hQ~Q�;�V�\Lu0��w��<���$�����Q�r�ڬI]a�����c����7w!�u�����H�Q��t�K�<lW�I��Nm�k~gJHHW�<^��z��E<�?a\��ӥ�%"1%�+��%U������@r�.�H^fm�`�@SiNLC9�ꓪ��
a���vl	e�'[�K��m��x&�w ewcq���#Ze�!�l�������z�	���;�[�ؙ������DT~��ճX��z��h8����+����:VV�.K0К����tMK&����o"`z����V1��o�&�{4�r�M��H�$��J��B~���e�	R�oא�ƕW:�`S�մ���꬀j���#e�V��U9��Q-����� ����4�b����rŷ.I�&�f Wđ�n��l�FR[�?���.
�|�_S���1}�����8�����R�Z�� ����;�W�+�
��X��	�d\l����M�/!{��tzzRa�b�`q��Xs?�B��]��߇`�]���Y~W��jM�m}���A�道trK̦R��VC�'�8�_�_7�4ش�ū˲�z<;X��a_bY�PU?4S=x8��Z[kjvh�T/�tp�8�ArL��Q��l�4�Z��GH�v�T��_�Zm��蝕�F�`��o75��v�Z͝cPZ�G9X+s���=�����*F�#�^��6�ڼ����6�=����g�~ %ɾ��1�������!�b����.���#���}v'�B����US�>���U�Dt��h�D��IFdō4���[�EE�hѴ�h�~u�v�ˋ!F��onf����7��h�⋐6���\P8֍��^Sr��vs�EL��ڵ,�k���-Z"�"'aV_K�v�m�탈��M�M��֠�`����}�VV�;Z��1��3-��-����O]������)�
0CV�3Mg�b�A�R
��I�^��X��TH;�t_٨�!
�,7�[E!�W6F��U�!M�'�Z2t�qP�Kޱ_BhxuvO�J��?v9��,I.ӣ0W%[Q1}d��ͼlcqM��np��x~ 
E�Ќ�V��hi>�������������w![���/9��%>��m�3�nW��2�-��6�9��4q���~~�Ǜ�p��a����Flsy{�x
��������^��,x����#�l��+ZW��I}�l
�;}��ͬ�O,�k~�k�Z�%a�W8�Ő�Ư����Sq��v�&����-�yN�8v�Uc��
�;���-���t'�5����n5��nq�M����6cJ���-��I]@��f�N��
Z@��_����3�m(����5���r���e?�b�h�+�)��oF0VÓ陵F��dH����ܮ= \�< n���'ʾݜ �r�e�c���4�?VN�0�[�و=���l�$��c1u6��)����8�(�&�`i��C�T]뚍����?H\��⤙���$�l��D��Y��,���ZK��(��wP޲���˼KH~ة�#S�<���8eŹA!b����Y�:�!&�$ .����4�s����hG�s�7%ݐ@�K.H&�&+��Y�&��{���m����FK&���-q?PayyeM�l�t]`!vg�}Xr�O����G���s�A��y�C������PnY���b#�f���J��UQIٓ�F����E2(���Z�X/L���	�LbC{J��;}|����C�SL@SGz������E��������&�9�#h��d9Ѵ"&��}��Rt����?7>�SW5w�hs�CQ�V�eb5��`���ӓ�:W�
�� r��VS���5mB�Y�5hE	���L�vt\�~v�}���M�c����{���̸}�T3��Ʉ����9�T�#:�k�@�>�ݲSFA1J�cD���Z�?�qS��lEA-5@p�v����Ib�I�<�k0q>�6��3uq93ݽ�$3�a��i�P���aw����瑘܀i�y��#9�7�n�������Y��q%H;sg+�;~X������;&��_��T��{�;+�>?ur��z42G��,,f�;�ܠ�D;���/h&#���Bm-tuin&�;�&���lĜ&tŁ�_4.s�E�ý�-ջ���q�E��C��q�i�]����A�w�C���'�۷#q�;����7��S�e�vW��P7�塋�St���<1h�Õ�.�kN��kܩe���/�h���ш�B�;\�`���,`�0lS'Uf���4��m�A���~���΁ʤ�O���83u{�U&���Z�~����X|�b�/�Î�y=	�=����@;C���]�W�Q7,>]�1 ��>���jy<Z�w��%S�c�D�T8L��P�MH#�ڈ�5e��Y���/�G���s3�U��>��o��2�ߪ��t^��VD��ԋ���&���X����22�+����h��� ?v7���?�;�o��YA��Q�����X��z�oB;���˖Q}��%�@6{�"�$<�9Ę�����:�L�6��4���B5Ќ#�.�5ɉ�VC7F���U�hB:e�rt^v#�EnWլ���oG��� ����5��a6"�����b������2�L���>E�T2S���W:�Z��y6`M����iE�G�M��1X��+R����5�
��=ܖqB�ci���MTh#I{��� σ�/Ƿ{�m�������Nc�G�󰟣��i��w̕awP�n�vX�ۓ��9�!>��-�$(���B�]��r�]�
)�{����,��yb~���p�-8���v�j�hVk�	5e�w�u�h�9����_<]����I�+�ѼZ���4L���2�@z����?����	�c�1H���J��6�N�$���S�]�S�,X�ea�R��AD�P���2T� -���@_�F�pj�8;�{�`���^*Y�%���& \pN���� i�\�ZsY��6P����gp���8�S�I�RT��y����H$anQ�F����esl�_��DOW���[��������OO7�������xD����Z��p�
8lⲭ����u�*�ըtu�d��Tf���YNYjJ��ˬ���e��uqj����U\�s=]=]�������f1���wu%�H�=�:����7�Jn~�|� ������s~N� �������o��Z�eB�o�/#r}�9�Rɔ��~?�P)SwI��D�p�|�D\|b�~m�Ƥ��n��ݫ��V��?K?.oa�-tB��D��
�o�����~Q��pe�J��R���%82F�<��㧨�8د�&N���FI'Ti�����B����Y`���O�2!�g9i!~/�����{'nL���!���qI�'b(W�3�L�]�1d4��������2!QHi���e��r[�,i^�!KM��Y���d1�Te�&*���H�T��1�)
�V���&�y%����iV�%�Ǧ�"VtS)�ݑNQ��YJ��<�B}�/�� "�,��Ox>Tm�ƀp��%�t����,�ʫ�[����+�*�w�*�3"K�WNDD�?������S�i���YJ���Tg)t�_TY�+U�|�j��`��E�����*>]G2�,Nzu�6EM��B�e�0�sͱ�����)Y�+�(}�����^ea��S�g"Δ&�j�L3�l�j?��ga����ί�ω</	�҇��E*Z�ϗu���ϗ�H�V�vk>��@3�U�+ ����,�VԨ�\�;iR`���W
��&��ɨ����1!�T!��=��ŋh� Oն��$�gi�2+<&[�����q�*+�L����"�N�h�$cY��*D2NV���-u�/(U�}P����R@E.ꈗ˲.�t*5��:D���X�ʋN�?�o�)��g��J���>�c�yk�����:ڔR�*BY �T
�ʘ;��*7U�<iS�˪����joP�X�t*r��/�y,� �B�o��Uc!g���ET5ƪU��㮟7P�J/����j�_OvB��F�,U6ܚ��}Y!�M���\��VS���9\2����� �_��r�4�\%�_�/�rKD�.����_"��v+M�O�<�G����w��M��ϱ-���e`��!���V3��i�^^UC�����,�.  