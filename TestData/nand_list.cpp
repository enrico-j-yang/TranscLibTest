#include "stdafx.h"
#include "transc.h"

#define ERROR_CHIP_ID			0xFFFFFFFF

typedef enum
{
	NAND_TYPE_UNKNOWN,
		NAND_TYPE_SAMSUNG,
		NAND_TYPE_HYNIX,
		NAND_TYPE_TOSHIBA,
		NAND_TYPE_TOSHIBA_EXT,
		NAND_TYPE_MICRON,
		NAND_TYPE_ST,
}
E_NAND_TYPE;

T_NAND_PHY_INFO SUPPORT_NAND_TABLE[] = {
// id      ,  pg_sz, pg_p_blk,chip_blk_num, group_blk_num,plane_blk_num,spare_size,c-cyc,c-mask ,r-cyc, r-mask,  c-nd, string
//A: Samsung
//----------------a: SLC small page
//32M
{0xbda575ec,  512,     32,      2048,    2048,           1024,  16,        1,    15,    2,  11,   0x01,  0x10000000, 0xf5ad1, 0x82627, "Samsung K9F5608"},
//64M
{0xbda576ec,  512,     32,      4096,    2048,           1024,  16,        1,    15,    3,  11,   0x01,  0x30000000, 0xf5ad1, 0x82627, "Samsung K9K1208"},
{0xc0a576ec,  512,     32,      4096,    4096,           4096,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x82627, "Samsung K9F1208"},
{0x3f5a76ec,  512,     32,      4096,    4096,           4096,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x82627, "Samsung K9F1208U0C"},
//128M
{0xc0a579ec,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x82627, "Samsung K9K1G08U0A"},
/* the following kind has the same id as "Samsung K9K1G08U0A"
{0xc0a579ec,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x82627, "Samsung K9T1G08U0M"},
*/
//asic_freq is 124M
{0x3f5a78ec,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x71515, "Samsung K5D1G12ACE"},
/* the following kind has the same id as "Samsung K9K1G08U0A"
{0xc0a579ec,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x01,  0x40000000, 0xf5ad1, 0x82627, "Samsung K9K1G08U0M"},
*/
//----------------b: SLC large page
//128M
{0x1580f1ec,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    2,  11,   0x01,  0xC0000000, 0xf5ad1, 0x40203, "Samsung K9F1G08U0M"},
/* the following kind has the same id as "Samsung K9F1G08U0M"
{0x1580f1ec,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    2,  11,   0x01,  0xC0000000, 0xf5ad1, 0x40203, "Samsung K9F1G08U0A"},
*/
{0x9500f1ec,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    2,  11,   0x01,  0x40000001, 0xf5ad1, 0x82626, "Samsung K9F1G08U0B"},
//256M
{0x1580daec,  2048,    64,      2048,    2048,           2048,  64,        2,    15,    3,  11,   0x01,  0xC0000000, 0xf5ad1, 0x40203, "Samsung K9F2G08U0M"},
{0x9510daec,  2048,    64,      2048,    2048,           1024,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x40203, "Samsung K9F2G08U0A"},
{0x15c1daec,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x01,  0xA0000000, 0xf5ad1, 0x40203, "Samsung K9K2G08U0M"},

//id not sure, 0x1500daec
//temp{0x15c1daec,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x01,  0xA0000000, 0xf5ad1, 0x82627, "Samsung K9K2G08U0A"},

//512M
{0x15c1dcec,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x01,  0xA0000000, 0xf5ad1, 0x40203, "Samsung K9K4G08U0M"},
{0x9510dcec,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x40203, "Samsung K9F4G08U0A"},
/* the following kind has the same id as "Samsung K9F4G08U0A"
{0x9510dcec,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x40203, "Samsung K9F4G08U0M"},
*/
/* the following kind has the same id as "Samsung K9K2G08U0M"
{0x15c1daec,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x01,  0xA0000000, 0xf5ad1, 0x40203, "Samsung K9W4G08U1M"},
*/
//1G
/* the following kind has the same id as "Samsung K9F4G08U0A"
{0x9510dcec,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x40203, "Samsung K9K8G08U1M"},
*/
/* the following kind has the same id as "Samsung K9F4G08U0A"
{0x9510dcec,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x40203, "Samsung K9K8G08U1A"},
*/

{0x9551d3ec,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9K8G08U0M"},
/* the following kind has the same id as "Samsung K9K8G08U0M"
{0x9551d3ec,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9K8G08U0A"},
*/
/* the following kind has the same id as "Samsung K9K4G08U0M"
{0x15c1dcec,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x01,  0xA0000000, 0xf5ad1, 0x40203, "Samsung K9W8G08U1M"},
*/
//2G
/* the following kind has the same id as "Samsung K9K8G08U0M"
{0x9551d3ec,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9WAG08U1A"},
*/
/* the following kind has the same id as "Samsung K9K8G08U0M"
{0x9551d3ec,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9WAG08U1M"},
*/
//4G
/* the following kind has the same id as "Samsung K9K8G08U0M"
{0x9551d3ec,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9NBG08U5A"},
*/
//temp{0xa610d3ec,  4096,    64,      4096,    4096,           2048,  128,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x82627, "Samsung K9F8G08U0M"},

//----------------c: MLC large page
//MLC 256M
{0x2514daec,  2048,    128,     1024,    1024,           1024,  64,        2,    15,    3,  11,   0x01,  0x40000001, 0xf5ad1, 0x82627, "Samsung K9G2G08U0M"},
//MLC 512M no copy_back
{0x2514dcec,  2048,    128,     2048,    2048,           1024,  64,        2,    15,    3,  11,   0x01,  0x10000001, 0xf5ad1, 0x40303, "Samsung K9G4G08U0A"},
//MLC 1G, no copy_back
{0x2555d3ec,  2048,    128,     4096,    2048,           1024,  64,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40203, "Samsung K9L8G08U0M"},
/* the following kind has the same id as "Samsung K9L8G08U0M"
{0x2555d3ec,  2048,    128,     4096,    2048,           1024,  64,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40203, "Samsung K9L8G08U0A"},
*/
//MLC 1G no copy_back
{0x2514d3ec,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x10000001, 0xf5ad1, 0x50303, "Samsung K9G8G08U0M"},
//MLC 1G with copy_back
{0xa514d3ec,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x50303, "Samsung K9G8G08U0A"},
//MLC 1G with copy_back
/* the following kind has the same id as "Samsung K9G8G08U0A"
{0xa514d3ec,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x90000001, 0xf5ad1, 0x50303, "Samsung K9G8G08U0B"},
*/
//MLC 2G no copy_back
{0x2555d5ec,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40203, "Samsung K9LAG08U0M"},
//MLC 2G with copy_back, 4 bit ECC
{0xa555d5ec,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9LAG08U0A"},
//MLC 2G
/* the following kind has the same id as "Samsung K9LAG08U0A"
{0xa555d5ec,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9LAG08U0B"},
*/
//MLC 2G, no copy_back
/* the following kind has the same id as "Samsung K9L8G08U0M"
{0x2555d3ec,  2048,    128,     4096,    2048,           1024,  64,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40203, "Samsung K9HAG08U1M"},
*/
//MLC 2G with copy_back, but opening copyback is dangerous with 4KB page nand!!
{0xb614d5ec,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x01,  0x10000001, 0xf5ad1, 0x40303, "Samsung K9GAG08U0M"},
//MLC 2G, 8 bit ecc, with copyback, but not to be used now
{0x2994d5ec,  4096,    128,     4096,    4096,           2048, 218,        2,    15,    3,  11,   0x01,  0x10000011, 0xf5ad1, 0x50303, "Samsung K9GAG08U0D"},
//4G
//MLC 4G, no copy_back
/* the following kind has the same id as "Samsung K9GAG08U0M"
{0xb614d5ec,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x01,  0x10000001, 0xf5ad1, 0x40303, "Samsung K9LBG08U1M"},
*/
//MLC 4G with copyback 2nCS_in_1_chip
/*the following kind has the same id as "Samsung K9LAG08U0A"
{0xa555d5ec,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0xB0000001, 0xf5ad1, 0x40203, "Samsung K9HBG08U1A"},
*/
//MLC 4G no copy_back
/* the following kind has the same id as "Samsung K9LAG08U0M"
{0x2555d5ec,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40203, "Samsung K9HBG08U1M"},
*/
//MLC 4G with copy_back, but opening copyback is dangerous with 4KB page nand!!
{0xb655d7ec,  4096,    128,     8192,    4096,           2048, 128,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40303, "Samsung K9LBG08U0M"},
//MLC 4G, 8 bit ecc, with copyback, but not to be used now
{0x29d5d7ec,  4096,    128,     8192,    4096,           2048, 218,        2,    15,    3,  11,   0x01,  0x30000011, 0xf5ad1, 0x82627, "Samsung K9LBG08U0D"},
//MLC 8G with copy_back, 2 CS, but opening copyback is dangerous with 4KB page nand!!
/* the following kind has the same id as "Samsung K9LBG08U0M"
{0xb655d7ec,  4096,    128,     8192,    4096,           2048, 128,        2,    15,    3,  11,   0x01,  0x30000001, 0xf5ad1, 0x40303, "Samsung K9HCG08U1M"},
*/
//MLC 8G, no copy_back
/* the following kind has the same id as "Samsung K9GAG08U0M"
{0xb614d5ec,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x01,  0x10000001, 0xf5ad1, 0x40303, "Samsung K9HCG08U5M"},
*/

//B: Hynix
//----------------a: SLC small page
//32MB
{0x75ad75ad,  512,     32,      2048,    1024,           1024,  16,        1,    15,    2,  11,   0x02,  0x20000000, 0xf5ad1, 0x82627, "Hynix HY27US08561A"},
//64MB
{0x00a576ad,  512,     32,      4096,    4096,           4096,  16,        1,    15,    3,  11,   0x02,  0x40000000, 0xf5ad1, 0x82627, "Hynix HY27US08121M"},
{0x76ad76ad,  512,     32,      4096,    2048,           1024,  16,        1,    15,    3,  11,   0x02,  0x30000000, 0xf5ad1, 0x82627, "Hynix HY27US08121A"},
//128MB
//{0x00a579ad,  512,     32,      8192,    2048,           2048,  16,        1,    15,    3,  11,   0x02,  0x20000000, 0xf5ad1, 0x82627, "Hynix HY27UA081G1M"},
{0x00a579ad,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x02,  0x40000000, 0xf5ad1, 0x82627, "Hynix HYC0UGG0M"},

//----------------b: SLC large page
//128M
{0x1580f1ad,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    3,  11,   0x02,  0xC0000000, 0xf5ad1, 0x82627, "Hynix HY27UF081G2M"},
{0x1580f120,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    3,  11,   0x02,  0xC0000000, 0xf5ad1, 0x82627, "Hynix HY27UF081G2M"},
{0x1d80f1ad,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    3,  11,   0x02,  0xC0000000, 0xf5ad1, 0x40203, "Hynix HY27UF081G2A"},
//256M
{0x1580daad,  2048,    64,      2048,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0xC0000000, 0xf5ad1, 0x82627, "Hynix HY27UF082G2M"},
{0x1d80daad,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x02,  0xA0000001, 0xf5ad1, 0x40203, "Hynix HY27UF082G2A"},
{0x9510daad,  2048,    64,      2048,    2048,           1024,  64,        2,    15,    3,  11,   0x02,  0x90000001, 0xf5ad1, 0x40203, "Hynix HY27UF082G2B"},

//id not sure
//temp{0x1500daad,  2048,    64,      2048,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0x40000001, 0xf5ad1, 0x82627, "Hynix HY27UG082G2M"},

//512M
{0x1580dcad,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0xA0000000, 0xf5ad1, 0x82627, "Hynix HY27UG084G2M"},
{0x9580dcad,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0xA0000001, 0xf5ad1, 0x40203, "Hynix HY27UF084G2M"},
{0x9510dcad,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x90000001, 0xf5ad1, 0x40203, "Hynix HY27UF084G2B"},

//id not sure
//temp{0x1500dcad,  2048,    64,      4096,    4096,           4096,  64,        2,    15,    3,  11,   0x05,  0x40000001, 0xf5ad1, 0x82627, "Hynix HY27UH084G2M"},

//1G
//1G 2_nCS_in_chip
/* the following kind has the same id as "Hynix HY27UF084G2B"
{0x9510dcad,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x90000001, 0xf5ad1, 0x40203, "Hynix HY27UG088G5B"},
*/
//1G 2_nCS_in_1_chip
/* the following kind has the same id as "Hynix HY27UF084G2M"
{0x9580dcad,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0xA0000001, 0xf5ad1, 0x40203, "Hynix HY27UG088G5M"},
*/
{0x1580d3ad,  2048,    64,      8192,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000001, 0xf5ad1, 0x82627, "Hynix HY27UH088G2M"},
//1G 4_nCS_in_1_chip
//temp{0x1580dcad,  2048,    64,      8192,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000001, 0xf5ad1, 0x82627, "Hynix HY27UH088GDM"},

//2G 2_nCS_in_1_chip                                                                                  
{0x95c1d3ad,  2048,    64,      8192,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0xA0000000, 0xf5ad1, 0x82627, "Hynix HY27UH08AG5M"},
//----------------c: MLC large page
//MLC 512M
{0x2584dcad,  2048,    128,     2048,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0x40000001, 0xf5ad1, 0x60404, "Hynix HY27UT084G2M"},
//MLC 512M
{0xa514dcad,  2048,    128,     2048,    2048,           1024,  64,        2,    15,    3,  11,   0x02,  0x90000001, 0xf5ad1, 0x51313, "Hynix HY27UT084G2A"},
//MLC 1G, 2_nCS_in_1_chip, no copy_back
/* the following kind has the same id as "Hynix HY27UT084G2M"
{0x2584dcad,  2048,    128,     2048,    2048,           2048,  64,        2,    15,    3,  11,   0x02,  0x40000001, 0xf5ad1, 0x60404, "Hynix HY27UU088G5M"},
*/
//MLC 1G, no copy_back
{0xa514d3ad,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UT088G2M"},
/* the following kind has the same id as "Hynix HY27UT088G2M"
{0xa514d3ad,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UT088G2A"},
*/
//MLC 1G, no copy_back
/* the following kind has the same id as "Hynix HY27UT088G2M"
{0xa514d3ad,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UU08AG5M"},
*/
/* the following kind has the same id as "Hynix HY27UT088G2M"
{0xa514d3ad,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UU08AG5A"},
*/
//MLC 2G 2_nCS_in_1_chip, no copy_back
{0x2585d3ad,  2048,    128,     4096,    4096,           4096,  64,        2,    15,    3,  11,   0x02,  0x40000001, 0xf5ad1, 0x60404, "Hynix HY27UV08AG5M"},
//MLC 2G, with copy back, but opening copyback is dangerous with 4KB page nand!!
/* the following kind has the same id as "Hynix H27UBG8U5M"
{0xb614d5ad,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x41313, "Hynix H27UAG8T2M"},
*/

//MLC 2G, 12 bit ecc, but few bit reversion, maybe can be used
//temp//{0x2594d5ad,  4096,    128,     4096,    4096,           2048, 224,        2,    15,    3,  11,   0x02,  0x10000011, 0xf5ad1, 0x50303, "Hynix H27UAG8T2A"},

//MLC 4G 2_nCS_in_1_chip, with copy_back, but open only when ecc is enhanced
{0xa555d5ad,  2048,    128,     8192,    8192,           4096,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UV08BG5M"},
/* the following kind has the same id as "Hynix HY27UV08BG5M"
{0xa555d5ad,  2048,    128,     8192,    8192,           4096,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40303, "Hynix HY27UV08BG5A"},
*/
//MLC 4G  2_nCS_in_1_chip, with copy back, but opening copyback is dangerous with 4KB page nand!!
{0xb614d5ad,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x41313, "Hynix H27UBG8U5M"},

//MLC 4G, 12 bit ecc, but few bit reversion, maybe can be used
/* the following kind has the same id as "Hynix H27UAG8T2A"
{0x2594d5ad,  4096,    128,     4096,    4096,           2048, 224,        2,    15,    3,  11,   0x02,  0x10000011, 0xf5ad1, 0x50303, "Hynix H27UBG8U5A"},
*/

/*the following kind has the same id as "Hynix HY27UV08AG5M"
{0x2585d3ad,  2048,    128,     4096,    4096,           4096,  64,        2,    15,    3,  11,   0x02,  0x40000001, 0xf5ad1, 0x60404, "Hynix HY27UW08BGFM"},
*/

//MLC 8G with no copy back 4_nCS_in_1_chip
/*the following kind has the same id as "Hynix HY27UV08BG5A" but the 5th ID is different.
{0xa555d5ad,  2048,    128,     8192,    8192,           4096,  64,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x40302, "Hynix HY27UW08CGFM"},
*/
//MLC 8G  2_nCS_in_1_chip, with copy back, but opening copyback is dangerous with 4KB page nand!!
{0xb655d7ad,  4096,    128,     8192,    4096,           2048, 128,        2,    15,    3,  11,   0x02,  0x30000001, 0xf5ad1, 0x41313, "Hynix H27UCG8V5M"},

//C: Toshiba
//----------------a: SLC small page
//128M

//id not sure, 0x79987998 or 0x00007998
//temp{0x79987998,  512,     32,      8192,    8192,           8192,  16,        1,    15,    3,  11,   0x6,   0x40000001, 0xf5ad1, 0x82627, "Toshiba TC58DVG02A1FT00"},

//----------------b: SLC large page
//128M
{0x9580f198,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    2,  11,   0x03,  0xC0000000, 0xf5ad1, 0x82627, "Toshiba TC58NVG0S3AFT05"},
//----------------c: MLC large page
//MLC 256M, id not sure
//temp{0xa584da98,  2048,    128,     1024,    1024,           1024,  64,        2,    15,    3,  11,   0x03,  0x40000001, 0xf5ad1, 0x82627, "Toshiba TC58NVG1D4BTG00"},
//MLC 512M
{0xa584dc98,  2048,    128,     2048,    1024,           1024,  64,        2,    15,    3,  11,   0x03,  0x20000001, 0xf5ad1, 0x40303, "Toshiba TC58NVG2D4BTG00"},

//initial bad block mark not sure, other features not sure
//temp{0x3294d598,  2048,    128,     2048,    2048,           2048,  64,        2,    15,    3,  11,   0x04,  0x40000001, 0xf5ad1, 0x82627, "Toshiba TC58NVG4D2ETA00"},

//MLC 1GB
{0xa584d398,  2048,    128,     4096,    2048,           2048,  64,        2,    15,    3,  11,   0x04,  0x20000001, 0xf5ad1, 0x40203, "Toshiba TC58NVG3D4CTG00"},
//MLC 1GB, 8 bit ecc
{0xba94d398,  4096,    128,     2048,    1024,           1024,  218,       2,    15,    3,  11,   0x04,  0x20000011, 0xf5ad1, 0x40203, "Toshiba TC58NVG3D1DTG00"},
//MLC 2GB
{0xa585d598,  2048,    128,     8192,    2048,           2048,  64,        2,    15,    3,  11,   0x04,  0x20000001, 0xf5ad1, 0x40203, "Toshiba TH58NVG4D4CTG00"},
//MLC 4GB
/* the following kind has the same id as "Toshiba TH58NVG4D4CTG00"
{0xa585d598,  2048,    128,     8192,    2048,           2048,  64,        2,    15,    3,  11,   0x04,  0x20000001, 0xf5ad1, 0x40203, "Toshiba TH58NVG5D4CTG20"},
*/
//MLC 8GB, 4_nCS_in_1_chip, 8 bit ecc, plane division not sure
//temp{0xba94d598,  4096,    128,     4096,    4096,           4096,  218,       2,    15,    3,  11,   0x04,  0x40000011, 0xf5ad1, 0x40303, "Toshiba TH58NVG6D1DTG80"},

//D: Micron
//----------------a: SLC small page
//----------------b: SLC large page
//256M
{0x1580da2c,  2048,    64,      2048,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xC0000001, 0xf5ad1, 0x40203, "Micron MT29F2G08AAC"},
/* the following kind has the same id as "Micron MT29F2G08AAC"
{0x1580da2c,  2048,    64,      2048,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xC0000001, 0xf5ad1, 0x40203, "Micron MT29F2G08AAB"},
*/
//temp{0x1580aa2c,  2048,    64,  	2048, 	 2048,			 2048,  64,        2, 	 15,    3,  11,   0x5,   0x40000001, 0xf5ad1, 0x40203, "Micron MT29F2G08ABD"},
//512M
{0x1580dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000000, 0xf5ad1, 0x82627, "Micron MT29F4G08BAB"},
/* the following kind has the same id as "Micron MT29F4G08BAB"
{0x1580dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000000, 0xf5ad1, 0x82627, "Micron MT29F4G08BAC"},
*/
{0x9590dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0x90000001, 0xf5ad1, 0x40203, "Micron MT29F4G08AAA"},
//temp{0x1590ac2c,  2048,    64,     4096,    4096,           4096,  64,        2,    15,    3,  11,   0x5,   0x40000001, 0xf5ad1, 0x40203, "Micron MT29F4G08ABC"},
//1G
//1G SLC, 4K page, 50nm, maybe the same as Intel JS29F08G08AANC1
{0x2e90d32c,  4096,    64,      4096,    4096,           2048,  218,       2,    15,    3,  11,   0x07,  0x10000011, 0xf5ad1, 0x40203, "Micron MT29F8G08AAA"},

/* the following kind has the same id as "Micron MT29F4G08BAB"
{0x1580dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000000, 0xf5ad1, 0x82627, "Micron MT29F8G08FAB"},
*/
/* the following kind has the same id as "Micron MT29F4G08BAB"
{0x1580dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0xA0000000, 0xf5ad1, 0x82627, "Micron MT29F8G08FAC"},
*/
/* the following kind has the same id as "Micron MT29F4G08AAA"
{0x9590dc2c,  2048,    64,      4096,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0x90000001, 0xf5ad1, 0x40203, "Micron MT29F8G08DAA"},
*/
/* the following kind has the same id as "Micron MT29F16G08FAA"
{0x95d1d32c,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0xB0000000, 0xf5ad1, 0x82627, "Micron MT29F8G08BAA"},
*/

//plane division not sure, one die considered as the same as MT29F8G08AAA because they are among the same series
{0x2ed1d52c,  4096,    64,      8192,    4096,           2048,  218,       2,    15,    3,  11,   0x07,  0x30000011, 0xf5ad1, 0x82627, "Micron MT29F16G08DAA"},

// 2G,2_nCS_in_1_chip, no copy_back.
{0x95d1d32c,  2048,    64,      8192,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0xB0000000, 0xf5ad1, 0x60325, "Micron MT29F16G08FAA"},
//4G
/* the following kind has the same id as "Micron MT29F16G08DAA", plane division not sure
{0x2ed1d52c,  4096,    64,      8192,    4096,           2048,  218,       2,    15,    3,  11,   0x07,  0x30000011, 0xf5ad1, 0x82627, "Micron MT29F32G08FAA"},
*/

//----------------c: MLC large page
//MLC 1G
{0xa594d32c,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x90000001, 0xf5ad1, 0x40303, "Micron MT29F8G08MAA"},
//MLC 1G
{0x2d94d32c,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x90000001, 0xf5ad1, 0x30202, "Micron MT29F8G08MAD"},
//MLC 2G, 2_nCS_in_1_chip, with copy_back
/* the following kind has the same id as "Micron MT29F8G08MAA"
{0xa594d32c,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x90000001, 0xf5ad1, 0x40303, "Micron MT29F16G08QAA"},
*/
//MLC 2G, with copy_back, but open only when ecc is enhanced, 8 bit ecc
{0x3e94d52c,  4096,    128,     4096,    4096,           2048, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40303, "Micron MT29F16G08MAA"},
//MLC 2G, 4K page, 256 page/Block(careful for new mtd), 12Bit ECC, need more test to support
//temp//{0x4604482c,  4096,    256,     2048,    2048,           1024, 224,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x82627, "Micron MT29F16G08CBA"},
//MLC 4G, 2_nCS_in_1_chip, with copy_back
{0xa595d52c,  2048,    128,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0xB0000001, 0xf5ad1, 0x40303, "Micron MT29F32G08TAA"},
/*the following kind has the same id as "Micron MT29F16G08MAA", 2_nCS_in_1_chip
{0x3e94d52c,  4096,    128,     4096,    4096,           2048, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40303, "Micron MT29F32G08QAA"},
*/
//MLC 4G, 12 bit ecc required, need more test to support
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "Micron MT29F32G08CBA"},
//MLC 4G
/*the following kind has the same id as "Micron MT29F32G08CBA"
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "Micron MT29F32G08MAA"},
*/
//8G
//2_nCS_in_1_chip, same serial as "Micron MT29F16G08MAA"
{0x3ed5d72c,  4096,    128,     8192,    4096,           2048, 218,        2,    15,    3,  11,   0x05,  0x30000011, 0xf5ad1, 0x40303, "Micron MT29F64G08TAA"},

/*the following kind has the same id as "Micron MT29F32G08CBA", 2_nCS_in_1_chip
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "Micron MT29F64G08CFA"},
*/
/*the following kind has the same id as "Micron MT29F32G08CBA", 2_nCS_in_1_chip, 2 IOs, forbidden to used!!!!
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "Micron MT29F64G08CEA"},
*/

//16G, 12 bit ecc, 2_nCS_in_1_chip, need more test to support
//temp//{0x3ed5d92c,  4096,    128,     16384,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x30000011, 0xf5ad1, 0x82627, "Micron MT29F128G08CJA"},

/*the following kind has the same id as "Micron MT29F128G08CJA", 2_nCS_in_1_chip, 2 IOs, forbidden to used!!!!
{0x3ed5d92c,  4096,    128,     16384,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x30000011, 0xf5ad1, 0x82627, "Micron MT29F128G08CKA"},
*/

//E: ST
//----------------a: SLC small page
// 32MB
{0x75207520,  512,     32,      2048,    1024,           1024,  16,        1,    15,    2,  11,   0x06,  0x20000000, 0xf5ad1, 0x82627, "ST NAND256W3A2BN6"},
// 64MB
{0x76207620,  512,     32,      4096,    2048,           2048,  16,        1,    15,    3,  11,   0x06,  0x20000000, 0xf5ad1, 0x82627, "ST NAND512W3A2CN6"},
// 128MB
//temp{0x79207920,  512,     32,      8192,    2048,           2048,  16,        1,    15,    3,  11,   0x06,  0x20000000, 0xf5ad1, 0x82627, "ST NAND01GW3A0AN6"},
//----------------b: SLC large page
//128M
{0x1d80f120,  2048,    64,      1024,    1024,           1024,  64,        2,    15,    2,  11,   0x06,  0xC0000000, 0xf5ad1, 0x50303, "ST NAND01GW3B2B"},
//256M
{0x1d80da20,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x06,  0xA0000000, 0xf5ad1, 0x50303, "ST NAND02GW3B2C"},

//id not sure
//temp{0x1580da20,  2048,    64,      2048,    1024,           1024,  64,        2,    15,    3,  11,   0x06,  0xA0000000, 0xf5ad1, 0x82627, "ST NAND02GW3B2A"},

//512M
{0x9580dc20,  2048,    64,      4096,    4096,           2048,  64,        2,    15,    3,  11,   0x06,  0xA0000000, 0xf5ad1, 0x40203, "ST NAND04GW3B2B"},
//1GB
{0x95c1d320,  2048,    64,      8192,    2048,           2048,  64,        2,    15,    3,  11,   0x06,  0xA0000000, 0xf5ad1, 0x40203, "ST NAND08GW3B2A"},
//----------------c: MLC large page
//512M
//temp{0xa514dc20,  2048,    128,     2048,    2048,           1024,  64,        2,    15,    3,  11,   0x06,  0x10000001, 0xf5ad1, 0x82627, "ST NAND04GW3C2B"},
//1GB
{0xa514d320,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x06,  0x10000001, 0xf5ad1, 0x40203, "ST NAND08GW3C2A"},

/* the following kind has the same id as "ST NAND08GW3C2A"
{0xa514d320,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x06,  0x10000001, 0xf5ad1, 0x40203, "ST NAND08GW3C2B"},
*/

//F: SPECTEK
//----------------a: SLC small page
//----------------b: SLC large page
//2GB, 2_nCS_in_1_chip
/*the following kind has the same id as "Micron MT29F8G08AAA"
{0x2e90d32c,  4096,    64,      4096,    4096,           2048,  218,       2,    15,    3,  11,   0x07,  0x10000011, 0xf5ad1, 0x40203, "SPECTEK FBNM51AHGK3W2"},
*/
//----------------c: MLC large page
//MLC 1G, open copyback when ecc is enhanced!!!
{0xa594d389,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x50303, "SPECTEK FTAL41B8GK3P"},
//MLC 4G
/*the following kind has the same id as "Micron MT29F32G08CBA", 12 bit ecc
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "SPECTEK FBNL63A51K3PG"},
*/
/*the following kind has the same id as "Micron MT29F32G08CBA", 12 bit ecc
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "SPECTEK FBNL63A56K3PG"},
*/
/*the following kind has the same id as "Micron MT29F32G08CBA", 12 bit ecc
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "SPECTEK FBNL63A56K3WG"},
*/
/*the following kind has the same id as "Micron MT29F32G08CBA", 12 bit ecc
{0x3e94d72c,  4096,    128,     8192,    8192,           4096, 218,        2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x40203, "SPECTEK FBNL63ANAK3PG"},
*/
//MLC 8G
/*the following kind has the same id as "Micron MT29F64G08TAA", 8 bit ecc, 2_nCS_in_1_chip
{0x3ed5d72c,  4096,    128,     8192,    4096,           2048, 218,        2,    15,    3,  11,   0x05,  0x30000011, 0xf5ad1, 0x40303, "SPECTEK FBNL52A64K3W4"},
*/

//G: INTEL
//----------------a: SLC small page
//----------------b: SLC large page
//256M SLC, 90nm, id not sure
//temp{0x1500da2c,  2048,    64,     2048,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0x40000001, 0xf5ad1, 0x82627, "Intel JS29F02G08AANA2"},
/* the following kind has the same id as "Intel JS29F02G08AANA2",  id not sure
{0x1500da2c,  2048,    64,     2048,    2048,           2048,  64,        2,    15,    3,  11,   0x05,  0x40000001, 0xf5ad1, 0x82627, "Intel JS29F02G08AANB3"},
*/
//512M SLC, 72nm
//temp{0x9590dc2c,  2048,    64,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x82627, "Intel JS29F04G08AANB1"},

//1G, 2_nCS_in_1_chip
{0x9590dc89,  2048,     64,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x50303, "Intel JS29F08G08CANC1"},

//1G SLC, 4K page, 50nm
{0x2e90d389,  4096,     64,     4096,    4096,           2048,  218,       2,    15,    3,  11,   0x07,  0x10000011, 0xf5ad1, 0x50303, "Intel JS29F08G08AANC1"},

//1G SLC, id not sure
//temp{0x1500dc2c,  2048,     64,     8192,    8192,           8192,  64,        2,    15,    3,  11,   0x05,  0x40000001, 0xf5ad1, 0x82627, "Intel JS29F08G08FANB3"},

//1G SLC, 2_nCS_in_1_chip
/* the following kind has the same id as "Intel JS29F04G08AANB1"
{0x9590dc2c,  2048,    64,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x82627, "Intel JS29F08G08CANB1"},
*/

//2G SLC, 2_nCS_in_1_chip
//temp{0x95d1d32c,  2048,     64,     8192,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x30000001, 0xf5ad1, 0x82627, "Intel JS29F16G08FANB1"},
//----------------c: MLC large page
//1G MLC, 72nm
//temp{0xa594d32c,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x82627, "Intel JS29F08G08AAMB1"},

//1G MLC, 72nm
//temp{0xa594d389,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x82627, "Intel JS29F08G08AAMB2"},

//1G MLC
{0x2d94d389,  2048,    128,     4096,    4096,           2048,  64,        2,    15,    3,  11,   0x05,  0x10000001, 0xf5ad1, 0x82627, "Intel JS29F08G08AAMC1"},

//2G MLC, 4K page, 50nm, 8 bit ecc required
//temp{0x3e94d589,  4096,    128,     4096,    4096,           2048,  218,       2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x82627, "Intel JS29F16G08AAMC1"},

//4G MLC, 12 bit ecc, the same characteristic as "Micron MT29F32G08CBA", just different manufactor
{0x3e94d789,  4096,    128,     8192,    8192,           4096,  218,       2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x50303, "Intel 29F32G08AAMD2"},

//8G MLC, 2_nCS_in_1_chip
/* the following kind has the same id as "Intel 29F32G08AAMD2"
{0x3e94d789,  4096,    128,     8192,    8192,           4096,  218,       2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x50303, "Intel 29F64G08CAMD2"},
*/

//H: DOWNGRADE
//----------------a: SLC small page
//----------------b: SLC large page
//----------------c: MLC large page
//4G
/* the following kind has the same id as "Intel 29F32G08AAMD2"
{0x3e94d789,  4096,    128,     8192,    8192,           4096,  218,       2,    15,    3,  11,   0x05,  0x10000011, 0xf5ad1, 0x50303, "DownG MLC32GW8ImF"},
*/

//I: DYNET
//----------------a: SLC small page
//----------------b: SLC large page
//----------------c: MLC large page
//2GB
/* the following kind has the same id as "Hynix H27UBG8U5M"
{0xb614d5ad,  4096,    128,     4096,    4096,           2048, 128,        2,    15,    3,  11,   0x02,  0x10000001, 0xf5ad1, 0x41313, "Dynet D27UAGT2M"},
*/

//end flag
{ERROR_CHIP_ID,0xFFFF,0xFFFF,   0xFFFF, 0xFFFF,  0xFFFF,     0xFF,      0xFF,   0xFF,  0xFF, 0xFF, 0xFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, ""}//end of this array
};

