import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.gray10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Obx(() => Text(
              controller.userResponse.fullName.orEmpty,
              style: AppStyle.textSemiBold(fontSize: 20)
            )),

            Obx(() => Text(
              controller.userResponse.email.orEmpty,
              style: AppStyle.textRegular(
                  color: AppColor.black50,
                  fontSize: 14
              )
            ))

          ]
        ),
        actions: [

          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () { },
                  child: Assets.lib.resources.drawables.icNotification.image()
              )
          )

        ]
      ),
      body: Container(
        color: AppColor.gray10,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
            children: [

                const SizedBox(height: 16),

                Row(
                    children: [

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                AppLocalizations.of(context)!.totalBalance,
                                style: AppStyle.textRegular(color: AppColor.black50)
                            ),

                            const SizedBox(height: 2),

                            Text(
                              AppLocalizations.of(context)!.rp0,
                              style: AppStyle.textSemiBold(fontSize: 20),
                            )

                          ]
                      ),

                      const Spacer(),

                      Obx(() => Visibility(
                          visible: controller.listWalletResponse.isNotEmpty,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.addWallet,
                                style: AppStyle.textSemiBold(color: AppColor.green100, fontSize: 14),
                              )
                          )
                      ))

                    ]
                ),

                const SizedBox(height: 16),

                Obx(() => Visibility(
                    visible: controller.listWalletResponse.isEmpty,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColor.green10,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Assets.lib.resources.drawables.icWalletGreen.image(),

                              const SizedBox(height: 16),

                              Text(
                                  AppLocalizations.of(context)!.ops,
                                  style: AppStyle.textSemiBold()
                              ),

                              const SizedBox(height: 8),

                              Text(
                                  AppLocalizations.of(context)!.notHaveWallets,
                                  style: AppStyle.textRegular(color: AppColor.black50)
                              ),

                              const SizedBox(height: 16),

                              TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                      AppLocalizations.of(context)!.createOne,
                                      style: AppStyle.textSemiBold(
                                          fontSize: 16,
                                          color: AppColor.green100
                                      )
                                  )
                              )

                            ]
                        )
                    )
                )),

                SizedBox(
                    height: 190,
                    child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listWalletResponse.length,
                        itemBuilder: (context, index) => Wrap(
                          children: [

                            Container(
                                margin: const EdgeInsets.only(right: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: AppColor.green10,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Row(
                                        children: [

                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.green100
                                            )
                                          ),

                                          const SizedBox(width: 8),

                                          Text(
                                            controller.listWalletResponse[index].type.orEmpty,
                                            style: AppStyle.textRegular(color: AppColor.green100),
                                          )

                                        ]
                                      ),

                                      const SizedBox(height: 16),

                                      Text(
                                        AppLocalizations.of(context)!.name,
                                        style: AppStyle.textRegular(color: AppColor.gray100),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                          controller.listWalletResponse[index].name.orEmpty,
                                          style: AppStyle.textRegular()
                                      ),

                                      const SizedBox(height: 16),

                                      Text(
                                        AppLocalizations.of(context)!.balance,
                                        style: AppStyle.textRegular(color: AppColor.gray100),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                          controller.listWalletResponse[index].balance.currencyFormat,
                                          style: AppStyle.textSemiBold(fontSize: 14)
                                      )

                                    ]
                                )
                            )

                          ]
                        )
                    ))
                )

              ]
            )
        )
      );
  }
}