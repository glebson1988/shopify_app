import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import {AppProvider, Page, Stack, TextStyle, Card, ResourceList} from "@shopify/polaris";
import en from '@shopify/polaris/locales/en.json';

class ProductList extends Component {
    constructor(props) {
        super(props);
    }

    renderProduct = (product) => {
        const {id, title, image} = product;

        return (
            <ResourceList.Item
                id={id}
                accessibilityLabel={`details for ${title}`}
            >
                <Stack>
                    <img src={image.src} style={{width: '100px'}}/>
                    <h3><TextStyle>{title}</TextStyle></h3>
                </Stack>
            </ResourceList.Item>
        );
    };

    render() {
        const {products, static_text} = this.props
        return (
            <AppProvider
                i18n={{
                    Polaris: {
                        ResourceList: {
                            showing: static_text.number_items_showing,
                            defaultItemSingular: static_text.item,
                            defaultItemPlural: static_text.items
                        }
                    }
                }}
            >
                <Page
                    title={static_text.title}
                >
                    <Card>
                        <ResourceList
                            showHeader
                            items={products}
                            renderItem={this.renderProduct}
                        >
                        </ResourceList>
                    </Card>
                </Page>
            </AppProvider>
        )
    }
}

export default ProductList;

document.addEventListener('DOMContentLoaded', () => {
    const node = document.getElementById('product-list');
    const data = JSON.parse(node.getAttribute('data'));
    ReactDOM.render(<ProductList {...data} />, node)
})
