{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{if $product['customizedDatas']}
	{foreach $product['customizedDatas'] as $customizationPerAddress}
		{foreach $customizationPerAddress as $customizationId => $customization}
			<tr class="customized customized-{$product['id_order_detail']|intval}">
				<td colspan="2">
				<input type="hidden" class="edit_product_id_order_detail" value="{$product['id_order_detail']|intval}" />
					<div class="form-horizontal">
						{foreach $customization.datas as $type => $datas}
							{if ($type == Product::CUSTOMIZE_FILE)}
								{foreach from=$datas item=data}
									<div class="form-group">
										<span class="col-lg-4 control-label"><strong>{if $data['name']}{$data['name']}{else}{l s='Picture #' d='Admin.Orderscustomers.Feature'}{$data@iteration}{/if}</strong></span>
										<div class="col-lg-8">
											<a href="displayImage.php?img={$data['value']}&amp;name={$order->id|intval}-file{$data@iteration}" class="_blank">
												<img class="img-thumbnail" src="{$smarty.const._THEME_PROD_PIC_DIR_}{$data['value']}_small" alt=""/>
											</a>
										</div>
									</div>
								{/foreach}
							{elseif ($type == Product::CUSTOMIZE_TEXTFIELD)}
								{foreach from=$datas item=data}
									<div class="form-group">
										<span class="col-lg-4 control-label"><strong>{if $data['name']}{$data['name']}{else}{l s='Text #%s' sprintf=[$data@iteration] d='Admin.Orderscustomers.Feature'}{/if}</strong></span>
										<div class="col-lg-8">
											<p class="form-control-static">{$data['value']}</p>
										</div>
									</div>
								{/foreach}
							{/if}
						{/foreach}
					</div>
				</td>
				<td></td>
				<td></td>
				{if $display_warehouse}<td></td>{/if}
				{if ($order->hasBeenPaid())}<td></td>{/if}
				{if ($order->hasBeenDelivered())}<td></td>{/if}
				<td></td>
				{if $stock_location_is_available}<td></td></td>{/if}
				<td></td>
				<td style="display:none"></td>
				<td style="display:none"></td>
				<td colspan="2" style="display:none; width: 250px;"></td>
				{if ($can_edit && !$order->hasBeenDelivered())}
					<td colspan="2" style="display:none"></td>
					<td style="text-align:right"></td>
				{/if}
			</tr>
		{/foreach}
	{/foreach}
{/if}
