//T、S系列机型

package woyou.aidlservice.jiuiv5;

import woyou.aidlservice.jiuiv5.ICallback;
import android.graphics.Bitmap;
import woyou.aidlservice.jiuiv5.ITax;

interface IWoyouService
{
	/**
	* 替换原打印机升级固件接口（void updateFirmware()）
	* 现更改为负载包名的数据接口，仅系统调用
	* 支持版本：4.0.0以上
	*/
    boolean postPrintData(String packageName, in byte[] data, int offset, int length);

	/**
	* 打印机固件状态
	* 返回： 0--未知， A5--bootloader, C3--print
	*/
	int getFirmwareStatus();

	/**
	* 获取打印服务版本
	* 返回： WoyouService服务版本
	*/
	String getServiceVersion();

	/**
	 * 初始化打印机，重置打印机的逻辑程序，但不清空缓存区数据，因此
	 * 未完成的打印作业将在重置后继续
	 */
	void printerInit(in ICallback callback);

	/**
	* 打印机自检，打印机会打印自检页
	*/
	void printerSelfChecking(in ICallback callback);

	/**
	* 获取打印机板序列号
	* 返回：打印机板的序列号
	*/
	String getPrinterSerialNo();

	/**
	* 获取打印机固件版本号
	* 返回：打印机固件版本号
	*/
	String getPrinterVersion();

	/**
	* 获取打印机型号
	* 返回：打印机型号
	*/
	String getPrinterModal();

	/**
	* 获取上电以来的打印长度
	* 返回：上电后的打印长度
	*/
	void getPrintedLength(in ICallback callback);

	/**
	 * 打印机走纸(强制换行，结束之前的打印内容后走纸n行)
	 * n: 走纸行数
	 */
	void lineWrap(int n, in ICallback callback);

	/**
	* epson指令打印
	*/
	void sendRAWData(in byte[] data, in ICallback callback);

	/**
	* 设置对齐模式，对之后打印有影响，除非初始化
	* alignment: 对齐方式 0--居左 , 1--居中, 2--居右
	*/
	void setAlignment(int alignment, in ICallback callback);

	/**
	* 设置打印字体, 暂时仅能系统调用，外部调用无效
	*/
	void setFontName(String typeface, in ICallback callback);

	/**
	* 设置字体大小, 对之后打印有影响，除非初始化
	* 注意：字体大小是超出标准国际指令的打印方式，
	* 调整字体大小会影响字符宽度，每行字符数量也会随之改变，
	* 因此按等宽字体形成的排版可能会错乱
	* fontsize:	字体大小
	*/
	void setFontSize(float fontsize, in ICallback callback);

	/**
	* 打印文字，文字宽度满一行自动换行排版，不满一整行不打印除非强制换行
	* text:	要打印的文字字符串
	*/
	void printText(String text, in ICallback callback);

	/**
	* 打印指定字体的文本，字体设置只对本次有效
	* text:	要打印文字
	* typeface: 字体名称（暂时仅能系统调用，外部调用无效）
	* fontsize:	字体大小
	*/
	void printTextWithFont(String text, String typeface, float fontsize, in ICallback callback);

	/**
	* 打印表格的一行，可以指定列宽、对齐方式
	* colsTextArr：各列文本字符串数组
	* colsWidthArr：各列宽度数组(以英文字符计算, 每个中文字符占两个英文字符, 每个宽度大于0)
	* colsAlign：各列对齐方式(0居左, 1居中, 2居右)
	* 注意: 三个参数的数组长度应该一致, 如果colsText[i]的宽度大于colsWidth[i], 则文本换行
	*/
	void printColumnsText(in String[] colsTextArr, in int[] colsWidthArr, in int[] colsAlign, in ICallback callback);


	/**
	* 打印图片
	* bitmap: 图片bitmap对象
	* 注意：最大宽度576像素，超出宽度将显示不全；图片大小长*宽<8M；
	*/
	void printBitmap(in Bitmap bitmap, in ICallback callback);

	/**
	* 打印一维条码
	* data: 条码数据
	* symbology: 条码类型
	*    0 -- UPC-A，
	*    1 -- UPC-E，
	*    2 -- JAN13(EAN13)，
	*    3 -- JAN8(EAN8)，
	*    4 -- CODE39，
	*    5 -- ITF，
	*    6 -- CODABAR，
	*    7 -- CODE93，
	*    8 -- CODE128
	* height: 条码高度, 取值1到255, 默认162
	* width:  条码宽度, 取值2至6, 默认2
	* textposition:	文字位置 0--不打印文字, 1--文字在条码上方, 2--文字在条码下方, 3--条码上下方均打印
	*/
	void printBarCode(String data, int symbology, int height, int width, int textposition,  in ICallback callback);

	/**
	* 打印二维条码
	* data:			二维码数据
	* modulesize:	二维码块大小(单位:点, 取值 1 至 16 )
	* errorlevel:	二维码纠错等级(0 至 3)，
	*               0 -- 纠错级别L ( 7%)，
	*               1 -- 纠错级别M (15%)，
	*               2 -- 纠错级别Q (25%)，
	*               3 -- 纠错级别H (30%)
	*/
	void printQRCode(String data, int modulesize, int errorlevel, in ICallback callback);

	/**
	* 打印文字，文字宽度满一行自动换行排版，不满一整行不打印除非强制换行
	* 文字按矢量文字宽度原样输出，即每个字符不等宽
	* text:	要打印的文字字符串
	*/
	void printOriginalText(String text, in ICallback callback);

	/**
	*   打印缓冲区内容
	*   支持版本：T1-v2.3.1以上
    *           T2、S2-v1.0.0以上
	*/
	void commitPrinterBuffer();

	/**
	*   切纸
	*/
	void cutPaper(in ICallback callback);

	/**
	*   获取切刀次数
	*/
	int getCutPaperTimes();

	/**
	*   打开钱箱
	*/
	void openDrawer(in ICallback callback);

	/**
	*   获取钱箱累计打开次数
	*/
	int getOpenDrawerTimes();

	/**
	* 进入事务模式，所有打印调用将缓存;
	* 调用commitPrinterBuffe()、exitPrinterBuffer(true)、commitPrinterBufferWithCallback()、
	* exitPrinterBufferWithCallback(true)后才进行打印；
	* clean: 如果之前没退出事务模式，是否清除已缓存的缓冲区内容
	* 支持版本：T1-v2.3.1以上
	*         T2、S2-v1.0.0以上
	*/
	void enterPrinterBuffer(in boolean clean);

	/**
	* 退出缓冲模式
	* commit: 是否打印出缓冲区内容
	* 支持版本：T1-v2.3.1以上
	*         T2、S2-v1.0.0以上
	*/
	void exitPrinterBuffer(in boolean commit);

    /**
    *   发送数控指令
    *   data：税控命令
    */
	void tax(in byte [] data,in ITax callback);

	/**
	* 获取当前打印机模式
	* 返回：0 普通模式 1黑标模式
	*/
	int getPrinterMode();

	/**
	* 获取黑标模式打印机自动走纸距离
	* 返回：检测到黑标后仍继续前进距离
	*/
	int getPrinterBBMDistance();

	/**
	* 打印表格的一行，可以指定列宽、对齐方式
	* colsTextArr： 各列文本字符串数组
	* colsWidthArr：各列宽度权重即各列所占比例
	* colsAlign：   各列对齐方式(0居左, 1居中, 2居右)
	* 备注: 三个参数的数组长度应该一致, 如果colsText[i]的宽度大于colsWidth[i], 则文本换行
	*/
	void printColumnsString(in String[] colsTextArr, in int[] colsWidthArr, in int[] colsAlign, in ICallback callback);

	/**
	* 获取打印机的最新状态
	* 返回值：1 打印机正常 2、打印机更新状态 3 获取状态异常  4 缺纸 5 过热  6 开盖 7切刀异常 8切刀恢复 505未检测到打印机
	**/
	int updatePrinterState();


	/**
	* 带反馈打印缓冲区内容
	* 支持版本：T1-v2.3.1以上
	*         T2、S2-v1.0.0以上
	*/
	void commitPrinterBufferWithCallback(in ICallback callback);

	/**
	* 带反馈退出缓冲打印模式
	* commit：退出时是否提交缓冲区内容
	* 支持版本：T1-v2.3.1以上
	*         T2、S2-v1.0.0以上
	*/
	void exitPrinterBufferWithCallback(in boolean commit, in ICallback callback);

    /**
    * 自定义打印图片
    * bitmap: 图片bitmap对象(最大宽度384像素，图片超过1M无法打印)
    * type:   目前有两种打印方式：0、同printBitmap 1、阈值200的黑白化图片 2、灰度图片
    * 支持版本：T1-v2.4.0以上
    *         T2、S2-v1.0.5以上
    */
    void printBitmapCustom(in Bitmap bitmap, in int type, in ICallback callback);

    /**
    *  台式打印机可以切换打印纸类型，此接口可以获取当前打印机支持的打印纸型号
    *  返回： 0: 80mm 1: 58mm
    *  支持版本：T1-v2.4.0以上
    *          T2、S2-v1.0.5以上
    */
    int getPrinterPaper();

    /**
    *   获取钱箱的状态
    *   返回：true 钱箱打开 false 钱箱关闭
    */
    boolean getDrawerStatus();
}