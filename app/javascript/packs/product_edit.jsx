import React, {Component} from "react";
import ReactDOM from 'react-dom';
import {AppProvider, Page, Stack, Button, Modal, Card, ResourceList} from "@shopify/polaris";
import en from '@shopify/polaris/locales/en.json';
import Block1 from "../block1";
import Block2 from "../block2";
import Block3 from "../block3";

class ProductEdit extends Component {
    constructor(props) {
        super(props);
        this.state = {
            blocks: [],
            resourcePickerOpen: false,
            currentBlockType: 'Block1',
            save_loading: false,
            save_disabled: true
        }
    }

    render() {
        const {product, product_images, static_text} = this.props

        return (
            <AppProvider i18n={en}>
                <Page
                    title={product.shopify_title}
                    primaryAction={{content: static_text.save}}>
                    <Card>
                        <img src={product.shopify_image_url} alt='' style={{maxWidth: '250px'}}/>
                        {product_images.map((image , i) => {
                            return (
                                <div key={i}>
                                    <img src={image.image_url} alt="" style={{maxWidth: '150px'}}/>
                                </div>
                            )
                        })}
                    </Card>
                </Page>
            </AppProvider>
        )
    }
}

export default ProductEdit;
document.addEventListener('DOMContentLoaded', () => {
    const node = document.getElementById('product-edit');
    const data = JSON.parse(node.getAttribute('data'));
    ReactDOM.render(<ProductEdit {...data} />, node);
})
