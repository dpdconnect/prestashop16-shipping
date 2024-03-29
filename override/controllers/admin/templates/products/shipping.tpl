<div id="product-shipping" class="panel product-tab">
	<input type="hidden" name="submitted_tabs[]" value="Shipping" />
	<h3>{l s='Shipping'}</h3>

	{if isset($display_common_field) && $display_common_field}
		<div class="alert alert-info">{l s='Warning, if you change the value of fields with an orange bullet %s, the value will be changed for all other shops for this product' sprintf=$bullet_common_field}</div>
	{/if}

	<div class="form-group">
		<label class="control-label col-lg-3" for="width">{$bullet_common_field} {l s='Package width'}</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$ps_dimension_unit}</span>
			<input maxlength="14" id="width" name="width" type="text" value="{$product->width}" onkeyup="if (isArrowKey(event)) return ;this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="height">{$bullet_common_field} {l s='Package height'}</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$ps_dimension_unit}</span>
			<input maxlength="14" id="height" name="height" type="text" value="{$product->height}" onkeyup="if (isArrowKey(event)) return ;this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="depth">{$bullet_common_field} {l s='Package depth'}</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$ps_dimension_unit}</span>
			<input maxlength="14" id="depth" name="depth" type="text" value="{$product->depth}" onkeyup="if (isArrowKey(event)) return ;this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="weight">{$bullet_common_field} {l s='Package weight'}</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$ps_weight_unit}</span>
			<input maxlength="14" id="weight" name="weight" type="text" value="{$product->weight}" onkeyup="if (isArrowKey(event)) return ;this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="additional_shipping_cost">
			<span class="label-tooltip" data-toggle="tooltip"
				title="{l s='If a carrier has a tax, it will be added to the shipping fees.'}">
				{l s='Additional shipping fees (for a single item)'}
			</span>

		</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$currency->prefix}{$currency->suffix} {if $country_display_tax_label}({l s='tax excl.'}){/if}</span>
			<input type="text" id="additional_shipping_cost" name="additional_shipping_cost" onchange="this.value = this.value.replace(/,/g, '.');" value="{$product->additional_shipping_cost|htmlentities}" />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="availableCarriers">{l s='Carriers'}</label>
		<div class="col-lg-9">
			<div class="form-control-static row">
				<div class="col-xs-6">
					<p>{l s='Available carriers'}</p>
					<select id="availableCarriers" name="availableCarriers" multiple="multiple">
						{foreach $carrier_list as $carrier}
							{if !isset($carrier.selected) || !$carrier.selected}
								<option value="{$carrier.id_reference}">{$carrier.name}</option>
							{/if}
						{/foreach}
					</select>
					<a href="#" id="addCarrier" class="btn btn-default btn-block">{l s='Add'} <i class="icon-arrow-right"></i></a>
				</div>
				<div class="col-xs-6">
					<p>{l s='Selected carriers'}</p>
					<select id="selectedCarriers" name="selectedCarriers[]" multiple="multiple">
						{foreach $carrier_list as $carrier}
							{if isset($carrier.selected) && $carrier.selected}
								<option value="{$carrier.id_reference}">{$carrier.name}</option>
							{/if}
						{/foreach}
					</select>
					<a href="#" id="removeCarrier" class="btn btn-default btn-block"><i class="icon-arrow-left"></i> {l s='Remove'}</a>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group" id="no-selected-carries-alert">
		<div class="col-lg-offset-3">
			<div class="alert alert-warning">{l s='If no carrier is selected then all the carriers will be available for customers orders.'}</div>
		</div>
	</div>

	<hr />

	<div class="form-group">
		<label class="control-label col-lg-3" for="dpd_shipping_product">{$bullet_common_field} {l s='DPD Shipping Product'}</label>
		<div class="input-group col-lg-2">
			<select name="dpd_shipping_product" id="dpd_shipping_product">
				<option value="default" {if $product->dpd_shipping_product == 'default'}selected="selected"{/if}>Default</option>
				<option value="fresh" {if $product->dpd_shipping_product == 'fresh'}selected="selected"{/if}>Fresh</option>
				<option value="freeze" {if $product->dpd_shipping_product == 'freeze'}selected="selected"{/if}>Freeze</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-lg-3" for="dpd_carrier_description">{$bullet_common_field} {l s='DPD Carrier Description'}</label>
		<div class="input-group col-lg-9">
			<textarea name="dpd_carrier_description" cols="15" rows="5">{$product->dpd_carrier_description}</textarea>
		</div>
	</div>

	<div class="panel-footer">
		<a href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}{if isset($smarty.request.page) && $smarty.request.page > 1}&amp;submitFilterproduct={$smarty.request.page|intval}{/if}" class="btn btn-default"><i class="process-icon-cancel"></i> {l s='Cancel'}</a>
		<button type="submit" name="submitAddproduct" class="btn btn-default pull-right" disabled="disabled"><i class="process-icon-loading"></i> {l s='Save'}</button>
		<button type="submit" name="submitAddproductAndStay" class="btn btn-default pull-right" disabled="disabled"><i class="process-icon-loading"></i> {l s='Save and stay'}</button>
	</div>
</div>
